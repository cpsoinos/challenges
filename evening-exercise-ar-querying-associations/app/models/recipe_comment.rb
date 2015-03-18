class RecipeComment < ActiveRecord::Base
  validates :recipe_id, presence: true
  validates :comment_id, presence: true

  belongs_to :recipe
  belongs_to :category
end
