class AddTimestampToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :timestamp, :datetime, default: DateTime.now
  end
  def down
    remove_column :recipes, :timestamp
  end
end
