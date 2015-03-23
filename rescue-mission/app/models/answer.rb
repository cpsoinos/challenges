class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :description,
    presence: true,
    length: { minimum: 50 }
  validates :user_id,
    presence: true
end
