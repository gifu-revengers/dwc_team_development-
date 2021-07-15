class Item < ApplicationRecord

  has_many :order_details
  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  attachment :item_image

  with_options presence: true do
    validates :genre_id
    validates :name
    validates :caption
    validates :price
    validates :item_image_id
    validates :is_active
  end

end
