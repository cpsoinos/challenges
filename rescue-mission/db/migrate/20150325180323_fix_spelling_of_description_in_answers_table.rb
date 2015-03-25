class FixSpellingOfDescriptionInAnswersTable < ActiveRecord::Migration
  def up
    remove_column :answers, :desciption
    add_column :answers, :description, :string, null: false
  end
  def down
    remove_column :answers, :description
    add_column :answers, :desciption, :string, null: false
  end
end
