class DeleteLocationIdFromMeetups < ActiveRecord::Migration
  def up
    remove_column :meetups, :location_id
  end

  def down
    add_column :meetups, :location_id, :integer
  end
end
