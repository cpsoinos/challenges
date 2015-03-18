class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user, null: false
      t.string :text, null: false
      # t.integer :recipe_id, null: false
    end
  end
end
