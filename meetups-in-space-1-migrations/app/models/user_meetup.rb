class UserMeetup < ActiveRecord::Base
  validates :user_id, presence: true
  validates :meetup_id, presence: true

  belongs_to :user
  belongs_to :meetup
end
