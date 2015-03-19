class AddCommentsToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :comment_id, :integer
  end

  def down
    remove_column :recipes, :comment_id
  end
end
