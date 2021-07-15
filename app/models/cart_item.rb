class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  with_options presence: true do
    validates :customer_id
    validates :item_id
    validates :quantity
  end

end
