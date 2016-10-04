class QuestionResponse < ActiveRecord::Base
  belongs_to :survey_response
  belongs_to :question

  belongs_to :user
  validates :user, presence: {strict: true}

  validates :survey_response, presence: true
  validates :question_group, presence: true

  validates :question, uniqueness: { scope: :survey_response_id }

  scope :orderd_by_question_number, ->() {
    joins(:question).order('question.number')
  }

  scope :question_id, ->(question_id) { 
    joins(:question).where(questions: {id: question_id}) 
  }

  scope :survey_id, ->(_id) { 
    joins(:survey_response).where(survey_responses: {survey_id: _id}) 
  }

  scope :crisis_id, ->(_id) { 
    joins(:survey_response).where(survey_responses: {crisis_id: _id}) 
  }

  scope :question_ids, ->(_ids) {
    joins(:question).where(questions: {id: _ids}) 
  }

  def question_group
    question.question_group
  end

  def participant_type
    survey_response.participant_type
  end
end
