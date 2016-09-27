class QuestionResponseFilter 
  include ActiveModel::AttributeMethods
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_accessor :survey_id, :country, :year, :crisis_id, :question

  def persisted?
    false
  end
end