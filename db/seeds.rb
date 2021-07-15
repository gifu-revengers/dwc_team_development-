# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 5.times do |n|
    Customer.create!(
      email: "mail#{n + 1}@gmail.com",
      password: "password#{n + 1}",
      last_name: "田中#{n + 1}",
      first_name: "太郎#{n + 1}",
      last_name_kana: "タナカ#{n + 1}",
      first_name_kana: "タロウ#{n + 1}",
      postcode: "000-000#{n + 1}",
      address: "田中の住所#{n + 1}",
      phone_number: "000-0000-000#{n + 1}"
    )


    Admin.create!(
      email: "admin#{n + 1}@gmail.com",
      password: "password#{n + 1}"
    )

    Order.create!(
      customer_id: n + 1,
      postage: 800,
      total_price: (n + 1) * (n + 1) * 1000,
      postcode: "000-000#{n + 1}",
      address: "住所#{n + 1}",
      address_name: "宛名#{n + 1}",
      payment_method: 0
    )

    Genre.create!(
      name: "ジャンル#{n + 1}"
    )

    Item.create!(
      genre_id: n + 1,
      name: "ケーキ#{n + 1}",
      caption: "このケーキは#{n + 1}番目に美味しい！",
      price: (n + 1) * 1000,
      item_image_id: "aa.jpg",
    )

    OrderDetail.create!(
      order_id: n + 1,
      item_id: n + 1,
      quantity: n + 1,
      price: (n + 1) * 1000
    )

    CartItem.create!(
      customer_id: n + 1,
      item_id: n + 1,
      quantity: n + 1
    )


    ShippingAddress.create!(
      customer_id: n + 1,
      postcode: "000-000#{n + 1}",
      address: "住所#{n + 1}",
      address_name: "宛名#{n + 1}"
    )
  end