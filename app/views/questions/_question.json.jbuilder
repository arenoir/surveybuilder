json.extract! question, :id, :survey_id, :question_group_id, :content, :created_at, :updated_at
json.url question_url(question, format: :json)