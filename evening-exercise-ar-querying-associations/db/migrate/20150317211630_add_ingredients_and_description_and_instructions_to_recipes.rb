class AddIngredientsAndDescriptionAndInstructionsToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :ingredients, :string
    add_column :recipes, :description, :string
    add_column :recipes, :instructions, :string
  end
  def down
    remove_column :recipes, :ingredients, :string
    remove_column :recipes, :description, :string
    remove_column :recipes, :instructions, :string
  end
end
