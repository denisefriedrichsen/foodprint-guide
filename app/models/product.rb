class Product < ApplicationRecord
  validates :name, presence: true
  validates :category, inclusion: {in: %w(fruits vegetables cereals dairy meat)}
  has_many :offerings
  has_many :producers, through: :offerings
end
