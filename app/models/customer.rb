class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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

end
