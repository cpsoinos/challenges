class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :title,
  presence: true,
  length: { minimum: 40 }

  validates :description,
    presence: true,
    length: { minimum: 150 }

  validates :user_id,
    presence: true
end
