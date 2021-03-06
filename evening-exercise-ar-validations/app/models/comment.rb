class Comment < ActiveRecord::Base
  validates :user, presence: true
  validates :text, presence: true, length: { maximum: 140 }
  validates :recipe_id, presence: true

  belongs_to :recipe
end
