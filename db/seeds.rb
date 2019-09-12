# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Service.destroy_all

barber_shop_1 = BarberShop.create(name: "The Bomb Barbers", location: "Bronx")
barber_shop_2 = BarberShop.create(name: "The Bomb Barbers 2", location: "Bronx")

barber_shop_3 = BarberShop.create(name: "Bronx Cuts", location: "Bronx")
barber_shop_4 = BarberShop.create(name: "Bronx Best Barbers", location: "Bronx")

barber_shop_5 = BarberShop.create(name: "Queens Cuts", location: "Queens")
barber_shop_6 = BarberShop.create(name: "Kings of Queens", location: "Queens")

barber_shop_7 = BarberShop.create(name: "Sharp Cuts", location: "Queens")
barber_shop_8 = BarberShop.create(name: "Queens Best Barbers", location: "Queens")

barber_shop_9 = BarberShop.create(name: "Brooklyn's Best Barbers", location: "Brooklyn")
barber_shop_10 = BarberShop.create(name: "Kings Barbers", location: "Brooklyn")

barber_shop_11 = BarberShop.create(name: "Brooklyn Cuts", location: "Brooklyn")
barber_shop_12 = BarberShop.create(name: "King of Kings", location: "Brooklyn")

barber_shop_13 = BarberShop.create(name: "Manhattan Barbers", location: "Manhattan")
barber_shop_14 = BarberShop.create(name: "Manhattan Cuts", location: "Manhattan")

barber_shop_15 = BarberShop.create(name: "Manhattan's Best Barbers", location: "Manhattan")
barber_shop_16 = BarberShop.create(name: "Big Apple Barbershop", location: "Manhattan")


new_service = Service.create(hair: "Mohawk", shape_up: "Shape Up", facial: "Facial", facial_hair: "Beard Trim", extra: "Extra")

puts "It has been seeded! ✂️"
