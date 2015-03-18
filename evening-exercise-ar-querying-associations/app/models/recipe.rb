class Recipe < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipes_comments
  has_many :comments, through: :recipes_comments
end
