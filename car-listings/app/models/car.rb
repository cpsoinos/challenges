class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :model, presence: true
  validates :color, presence: true
  validates :year, presence: true, :inclusion => { :in => 1920..2025 }
  validates :mileage, presence: true
  validates :manufacturer_id, presence: true
end
