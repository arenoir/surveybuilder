module SurveyResponseHelper
  
  def is_survey_field_disabled?(optons={})
    if action_name == "show"
      return true
    end
  end

end

