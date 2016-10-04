class QuestionResponseFilter 
  include ActiveModel::AttributeMethods
  include ActiveModel::AttributeAssignment
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_accessor :survey_id, :country, :year, :crisis_id, :question_ids, :participant_types

  def persisted?
    false
  end
end