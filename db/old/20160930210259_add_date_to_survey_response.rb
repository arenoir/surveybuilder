class AddDateToSurveyResponse < ActiveRecord::Migration[5.0]
  def change
    add_column :survey_responses, :date, :date
    
    reversible do |dir|
      dir.up do
        ActiveRecord::Base.record_timestamps = false
        SurveyResponse.reset_column_information
        SurveyResponse.all.each do |sr|
          sr.date = sr.created_at || Time.now
          sr.save!
        end
      end
    end
  end
end
