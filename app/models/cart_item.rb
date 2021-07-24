class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  with_options presence: true do
    validates :customer_id
    validates :item_id
    validates :quantity
  end

  #追加メソッド
  def subtotal
    self.quantity * self.item.tax_include
  end

  def total
    cart_items=CartItem.where(customer_id: current_customer)
    cart_items.each do |cart_item|
      total_price + cart_item.subtotal
    end
    return total_price
  end

end
