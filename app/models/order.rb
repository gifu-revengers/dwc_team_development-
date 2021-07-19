class Order < ApplicationRecord

  enum status: { '入金待ち': 0, '入金確認': 1, '製作中': 2, '発送準備中': 3, '発送済み':4 }
  enum payment_method: { 'クレジット': 0, '銀行振込': 1 }

  with_options presence: true do
    validates :customer_id
    validates :postage
    validates :total_price
    validates :postcode
    validates :address
    validates :address_name
    validates :payment_method
    validates :status
  end

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  attr_accessor :shipping_sel,:shipping_address_id

  #追加メソッド

  #注文個数の合計を返す
  def order_quantity_count
    order_details = OrderDetail.where(order_id: self.id)
    count = 0
    order_details.each do |order_detail|
      count += order_detail.quantity
    end
    return count
  end

  #送料含む総額を返す
  def amount_including_shipping
    self.total_price + self.postage
  end

end
