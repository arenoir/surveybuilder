class UpdateSurveyResponsesIteration < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        SurveyResponse.where(iteration: nil).update_all(:iteration => 1)
      end
    end
  end
end
