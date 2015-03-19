class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false, uniqueness: true
      # t.integer :comment_id
    end
  end
end
