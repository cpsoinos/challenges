class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :user_id, null: false, unique: true
      t.timestamps null: false
    end
  end
end
