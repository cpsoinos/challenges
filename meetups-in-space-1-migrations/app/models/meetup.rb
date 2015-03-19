class Meetup < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :location_id, presence: true

  belongs_to :location
  has_many :users_meetups
  has_many :users, through: :users_meetups
end
