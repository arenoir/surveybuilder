class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :survey, index: true, foreign_key: true
      t.references :question_group, index: true, foreign_key: true
      t.text :content
      t.string :questions
      t.string :answer_type
      t.integer :max_value
      t.integer :min_value

      t.timestamps null: false
    end
  end
end
