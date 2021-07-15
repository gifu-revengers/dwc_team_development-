class ShippingAddress < ApplicationRecord

  belongs_to :customer

  with_options presence: true do
    validates :customer_id
    validates :postcode
    validates :address
    validates :address_name
  end

end
