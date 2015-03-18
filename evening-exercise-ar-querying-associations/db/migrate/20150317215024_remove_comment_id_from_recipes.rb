class RemoveCommentIdFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :comment_id
  end

  def down
    add_column :recipes, :comment_id, :integer
  end
end
