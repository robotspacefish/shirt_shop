# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(username: 'admin', password: 'admin', shop_owner: true)

Shop.create(name: 'MyShop')

shop = Shop.create(name: 'Shirts "R" Us')

shirts = [
  Shirt.create(name: "V-Neck", description: "Maecenas sed diam eget risus varius blandit sit amet non magna.", size: "M", price_in_cents: 2400, color: "red" ),
  Shirt.create(name: "V-Neck", description: "Maecenas sed diam eget risus varius blandit sit amet non magna.", size: "L", price_in_cents: 2400, color: "black" ),
  Shirt.create(name: "Ringer", description: "Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Etiam porta sem malesuada magna mollis euismod.", size: "S", price_in_cents: 1800, color: "gray" ),
  Shirt.create(name: "Ringer", description: "Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Etiam porta sem malesuada magna mollis euismod.", size: "L", price_in_cents: 1800, color: "gray" )
]

user.shop = shop
shirts.each { |s| shop.shirts << s }