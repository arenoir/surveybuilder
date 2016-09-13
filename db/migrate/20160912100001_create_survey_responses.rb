class CreateSurveyResponses < ActiveRecord::Migration
  def change
    create_table :survey_responses do |t|
      t.references :survey, index: true, foreign_key: true
      t.string :participant_id
      t.string :participant_type
      t.timestamps null: false
    end
  end
end
