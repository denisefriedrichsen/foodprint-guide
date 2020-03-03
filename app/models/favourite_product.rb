class FavouriteProduct < ApplicationRecord
  belongs_to :product_id
  belongs_to :user_id
  validates :user_id, presence: true
  validates :product_id, presence: true
end
