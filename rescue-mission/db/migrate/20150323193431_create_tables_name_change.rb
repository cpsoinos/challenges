class CreateTablesNameChange < ActiveRecord::Migration
  def change
    rename_table :answers_tables, :answers
    rename_table :questions_tables, :questions
    rename_table :users_tables, :users
  end
end
