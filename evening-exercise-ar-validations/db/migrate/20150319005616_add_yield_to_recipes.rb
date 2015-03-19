class AddYieldToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :yield, :integer
  end
  def down
    remove_column :recipes, :yield
  end
end
