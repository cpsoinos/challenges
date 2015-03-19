class CreateRecipesComments < ActiveRecord::Migration
  def change
    create_table :recipes_comments do |t|
      t.integer :recipe_id, null: false
      t.integer :comment_id, null:false
    end
  end
end
