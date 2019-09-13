# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Appointment.destroy_all
# Barbor.destroy_all
# Customer.destroy_all
BarberShop.destroy_all
Barber.destroy_all
Customer.destroy_all
Appointment.destroy_all


BarberShop.create(name: "Select one", location: "None")
BarberShop.create(name: "Excellent Barbor Shop", location: "Bronx")
BarberShop.create(name: "The Flatiron Barbors", location: "Brooklyn")
BarberShop.create(name: "The Heights Barbor Shop", location: "Manhattan")
BarberShop.create(name: "Astoria Cuts", location: "Queen")

Customer.create(name:"Joel Mendoza",age: 20,location: "Bronx",email: "joelmendoza@gmail.com" ,cell: 3476665670, password: "123456")

