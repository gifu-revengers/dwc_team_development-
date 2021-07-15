class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  with_options presence: true do
    validates :order_id
    validates :item_id
    validates :quantity
    validates :price
    validates :status
  end

end
