class Post < ApplicationRecord
  belongs_to :producer, dependent: :destroy

   validates :title, presence: true
   validates :producer_id, presence: true
end
