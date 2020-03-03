class Product < ApplicationRecord
  validates :name, presence: true
  validates :category, inclusion: {in: %w(fruits vegetables cereals dairy meat)}
end
