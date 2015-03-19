class AddLocationToMeetups < ActiveRecord::Migration
  class Meetup < ActiveRecord::Base
    belongs_to :location
  end

  def up
    add_column :meetups, :location_id, :integer

    Meetup.all.each do |meetup|
      location = Location.find_by(name: meetup.name)
      if location.present?
        meetup.location_id = location.location_id
      else
        Location.create(name: meetup.name)
        meetup.location_id = location.id
      end
      meetup.save
    end

    remove_column :meetups, :location
  end

  def down
    add_column :meetups, :location, :integer

    Meetup.all.each do |meetup|
      meetup.name = location.meetup.name
      meetup.save
    end

    remove_column :meetups, :location_id
  end
end
