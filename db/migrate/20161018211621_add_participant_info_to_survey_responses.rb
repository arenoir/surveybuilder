class AddParticipantInfoToSurveyResponses < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :note, :text
    add_column :survey_responses, :participant_gender, :string
    add_column :survey_responses, :participant_age, :integer

    reversible do |dir|
      dir.up do
        execute "UPDATE survey_responses SET participant_gender = 'Male' WHERE participant_type IN ('Boy', 'Man');"
        execute "UPDATE survey_responses SET participant_gender = 'Female' WHERE participant_type IN ('Girl', 'Woman');"

        execute "UPDATE survey_responses SET participant_age = 8 WHERE participant_type IN ('Boy', 'Girl');"
        execute "UPDATE survey_responses SET participant_age = 18 WHERE participant_type IN ('Man', 'Woman');"
      end
    end
  end
end
