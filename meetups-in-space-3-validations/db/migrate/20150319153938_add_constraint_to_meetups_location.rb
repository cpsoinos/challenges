class AddConstraintToMeetupsLocation < ActiveRecord::Migration
  def up
    change_column :meetups, :location, :string, null: false
  end
  def down
    change_column :meetups, :location, :string
  end
end
