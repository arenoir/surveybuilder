class AddUserIdToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :user_id, :integer
    add_column :survey_responses, :user_id, :integer
    add_column :questions, :user_id, :integer
    add_column :question_responses, :user_id, :integer
    add_column :question_groups, :user_id, :integer

    reversible do |dir|
      dir.up do

        u = User.first

        if u.nil?
          u = User.create!(email: "meganrenoir@gmail.com", roles_mask: 1, password: "megansucks")
        end

        ActiveRecord::Base.record_timestamps = false
        Survey.reset_column_information
        SurveyResponse.reset_column_information
        Question.reset_column_information
        QuestionResponse.reset_column_information
        QuestionGroup.reset_column_information

        Survey.where(user_id: nil).update_all(:user_id => u.id)
        SurveyResponse.where(user_id: nil).update_all(:user_id => u.id)
        Question.where(user_id: nil).update_all(:user_id => u.id)
        QuestionResponse.where(user_id: nil).update_all(:user_id => u.id)
        QuestionGroup.where(user_id: nil).update_all(:user_id => u.id)
      end
    end

  end
end
