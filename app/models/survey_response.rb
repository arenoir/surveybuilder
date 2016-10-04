class SurveyResponse < ActiveRecord::Base

  PARTICIPANT_TYPES = %w(Man Woman Boy Girl)

  belongs_to :survey
  belongs_to :crisis

  belongs_to :user
  validates :user, presence: {strict: true}

  has_many :questions, :through => :survey
  has_many :question_responses,
    :before_add => :before_add_question_responses,
    :dependent => :destroy

  validates :survey_id, presence: true
  validates :crisis_id, presence: true

  validates :participant_type, presence: true, :inclusion => { :in => PARTICIPANT_TYPES }
  validates :date, presence: true
  validates :iteration, numericality: { only_integer: true, greater_than: 0}

  accepts_nested_attributes_for :question_responses

  def editable_question_responses
    @editable_question_responses ||= questions.map do |q|
      question_responses.find_or_initialize_by(question_id: q.id)
    end
  end

  def editable_question_reponses_by_group
    editable_question_responses.group_by(&:question_group)
  end

  scope :survey_id, ->(_id) { 
    where(survey_id: _id) 
  }

  scope :crisis_id, ->(_id) { 
    where(crisis_id: _id) 
  }

private

  def before_add_question_responses(qr)
    qr.user = user
  end

end
