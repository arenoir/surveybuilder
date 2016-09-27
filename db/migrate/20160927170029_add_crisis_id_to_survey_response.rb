class AddCrisisIdToSurveyResponse < ActiveRecord::Migration
  def change
    add_reference :survey_responses, :crisis, index: true, foreign_key: true
    add_column :survey_responses, :orginisation_name, :string
    add_column :survey_responses, :iteration, :integer
    add_column :survey_responses, :latitude, :string
    add_column :survey_responses, :longitude, :string
  end
end
