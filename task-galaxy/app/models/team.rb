class Team < ActiveRecord::Base
  validates :user_id, presence: true,
    uniqueness: { scope: :project_id }
  validates :project_id, presence: true

  belongs_to :user
  belongs_to :project
end
