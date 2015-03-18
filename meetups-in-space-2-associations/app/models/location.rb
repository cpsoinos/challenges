class Location < ActiveRecord::Base
  validates :name, presence: true

  has_many :meetups
end
