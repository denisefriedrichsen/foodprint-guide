class FavouriteProducer < ApplicationRecord
  belongs_to :user
  belongs_to :producer
  validates :user_id, presence: true
  validates :producer_id, presence: true
end
