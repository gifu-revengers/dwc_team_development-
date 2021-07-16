class ShippingAddress < ApplicationRecord

  belongs_to :customer

  with_options presence: true do
    validates :customer_id
    validates :postcode
    validates :address
    validates :address_name
  end

  validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}

end
