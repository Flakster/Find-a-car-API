# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    password: 'pass123',
    admin: false
  )
end

10.times do
  Car.create(
    make: Faker::Vehicle.make,
    color: Faker::Vehicle.color,
    year: Faker::Vehicle.year,
    price: Faker::Number.within(range: 5000..20000)
  )
end