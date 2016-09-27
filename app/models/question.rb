class Question < ActiveRecord::Base

  ANSWER_TYPES = %w(Boolean Scale)

  belongs_to :survey
  belongs_to :question_group

  has_many :question_responses

  validates :survey, presence: true
  validates :question_group, presence: true
  validates :answer_type, presence: true, :inclusion => { :in => ANSWER_TYPES }


  def boys_average
    question_responses.joins(:survey_response).where(:survey_responses => {:participant_type => "Boy"}).average(:answer)
  end

  def girls_average
    question_responses.joins(:survey_response).where(:survey_responses => {:participant_type => "Girl"}).average(:answer)
  end

end
