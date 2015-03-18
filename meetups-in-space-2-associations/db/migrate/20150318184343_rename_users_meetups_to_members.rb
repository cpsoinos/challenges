class RenameUsersMeetupsToMembers < ActiveRecord::Migration
  def change
    rename_table :users_meetups, :members
  end
end
