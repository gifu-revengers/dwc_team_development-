class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :postcode
    validates :address
    validates :phone_number
  end

  validates :postcode, format: {with: /\A[0-9]{7}\z/}
  validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}

  has_many :orders
  has_many :cart_items, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  #追加メソッド
  def join_name
    self.last_name + " " + self.first_name
  end

  def join_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  #退会していたらtrueを返す
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
