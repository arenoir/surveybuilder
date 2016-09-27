class QuestionResponse < ActiveRecord::Base
  belongs_to :survey_response
  belongs_to :question

  validates :survey_response, presence: true
  validates :question_group, presence: true

  validates :question, uniqueness: { scope: :survey_response }

  scope :orderd_by_question_number, ->() {
    joins(:question).order('question.number')
  }

  scope :question_id, ->(question_id) { 
    joins(:question).where(questions: {id: question_id}) 
  }

  def question_group
    question.question_group
  end

  def participant_type
    survey_response.participant_type
  end
end
