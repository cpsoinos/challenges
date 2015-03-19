class CreateUsersMeetups < ActiveRecord::Migration
  def change
    create_table :users_meetups do |t|
      t.integer :users_id, null: false
      t.integer :meetups_id, null: false
    end
  end
end
