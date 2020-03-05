class Post < ApplicationRecord
  belongs_to :producer

   validates :title, presence: true
   validates :producer_id, presence: true
end
