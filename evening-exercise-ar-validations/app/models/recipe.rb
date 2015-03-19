class Recipe < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :name, format: { with: /(brussels sprouts)/i,
    message: "only allows recipes with 'brussels sprouts' in the title" }
  validates :yield, numericality: { greater_than_or_equal_to: 1 }

  has_many :recipes_comments
  has_many :comments, through: :recipes_comments
end
