class Meetup < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :location_id, presence: true

  belongs_to :location
end
