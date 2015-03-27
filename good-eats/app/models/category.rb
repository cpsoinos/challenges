class Category < ActiveRecord::Base
  has_many :restaurants

  validates :name,
    uniqueness: true
end
