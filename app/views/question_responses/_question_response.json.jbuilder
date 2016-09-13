json.extract! question_response, :id, :survey_response_id, :question_id, :answer, :answer_type, :created_at, :updated_at
json.url question_response_url(question_response, format: :json)