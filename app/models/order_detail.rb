class OrderDetail < ApplicationRecord

  enum status: { '着手不可': 0, '製作待ち': 1, '製作中': 2, '製作完了': 3 }

  belongs_to :order
  belongs_to :item

  with_options presence: true do
    validates :order_id
    validates :item_id
    validates :quantity
    validates :price
    validates :status
  end

  #追加メソッド

  #単価を返す
  def unit_price
    self.price / self.quantity
  end
end
