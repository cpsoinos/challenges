class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :description,
    presence: true,
    length: { minimum: 50 }

  validates :question_id,
  presence: true

  validates :user_id,
    presence: true
end
