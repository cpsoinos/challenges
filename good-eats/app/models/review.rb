class Review < ActiveRecord::Base
  belongs_to :restaurant

  validates :body,
    presence: true

  validates :rating,
    presence: true,
    :inclusion => 1..5

  validates :restaurant_id,
    presence: true
end
