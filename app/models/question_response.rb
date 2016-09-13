class QuestionResponse < ActiveRecord::Base
  belongs_to :survey_response
  belongs_to :question

  validates :survey_response, presence: true
  validates :question_group, presence: true

  def question_group
    question.question_group
  end
end
