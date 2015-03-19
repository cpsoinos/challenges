class DeleteLocationsTableAddToMeetups < ActiveRecord::Migration
  def up
    drop_table :locations

    remove_column :meetups, :location_id
    add_column :meetups, :location, :string
  end

  def down
    create_table :locations do |t|
      t.string :name, null: false
    end

    remove_column :meetups, :location
  end
end
