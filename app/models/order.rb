class Order < ApplicationRecord

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

end
