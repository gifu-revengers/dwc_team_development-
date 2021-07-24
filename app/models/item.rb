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
    validates :item_image
  end

    validates :is_active,inclusion: { in: [true,false]}

  # 消費税込みの値段表示
  def tax_include
    tax = 1.10
    (price * tax).round
  end
end
