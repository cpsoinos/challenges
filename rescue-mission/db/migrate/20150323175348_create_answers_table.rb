class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers_tables do |t|
      t.string :desciption, null: false
      t.integer :question_id, null: false, unique: true
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
