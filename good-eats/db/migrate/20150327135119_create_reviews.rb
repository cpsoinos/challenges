class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :body, null: false
      t.integer :rating, null: false
      t.integer :restaurant_id, null: false

      t.timestamps null: false
    end
  end
end
