class SurveyResponse < ActiveRecord::Base

  PARTICIPANT_TYPES = %w(Man Woman Boy Girl)

  belongs_to :survey
  belongs_to :crisis
  has_many :questions, :through => :survey
  has_many :question_responses

  validates :survey_id, presence: true
  validates :crisis_id, presence: true

  validates :participant_type, presence: true, :inclusion => { :in => PARTICIPANT_TYPES }

  accepts_nested_attributes_for :question_responses

  def editable_question_responses
    @editable_question_responses ||= questions.map do |q|
      question_responses.find_or_initialize_by(question_id: q.id)
    end
  end

  def editable_question_reponses_by_group
    editable_question_responses.group_by(&:question_group)
  end


  scope :by_question, ->(question_id) { 
    joins(:questions).where(questions: {id: question_id}) 
  }

end
