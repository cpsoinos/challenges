class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users_tables do |t|
      t.string :username, null: false

      t.timestamps null: false
    end
  end
end
