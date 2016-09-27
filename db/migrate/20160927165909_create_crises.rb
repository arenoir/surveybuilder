class CreateCrises < ActiveRecord::Migration
  def change
    create_table :crises do |t|
      t.string :name
      t.string :country
      t.timestamp :date

      t.timestamps null: false
    end
  end
end
