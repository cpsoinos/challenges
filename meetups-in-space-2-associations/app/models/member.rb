class Member < ActiveRecord::Base
  validates :users_id, presence: true
  validates :meetups_id, presence: true

  belongs_to :user
  belongs_to :meetup
end
