class User < ActiveRecord::Base

  def at_least_one_name
    if [self.first_name, self.last_name].reject(&:blank?).size == 0
      errors[:base] << ("You must enter a first or last name.")
    end
  end

  validates :email, presence: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true
  validate :at_least_one_name

  has_many :tasks
  has_many :teams
  has_many :projects,
    through: :teams
end
