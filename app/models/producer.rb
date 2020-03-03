class Producer < ApplicationRecord
  has_one_attached :photo
  validates :company_name, presence: true
  validates :owner_name, presence: true
  validates :address, presence: true
  has_many :offerings
  has_many :products, through: :offerings
  has_many :posts
end
