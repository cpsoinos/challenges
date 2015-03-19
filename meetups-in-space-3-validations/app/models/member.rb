class Member < ActiveRecord::Base
  validates :users_id, presence: true,
    uniqueness: { scope: :meetups_id }
  validates :meetups_id, presence: true

  belongs_to :user
  belongs_to :meetup
end
