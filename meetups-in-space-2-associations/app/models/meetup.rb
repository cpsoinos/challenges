class Meetup < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :location, presence: true

  has_many :members
  has_many :users, through: :members
end
