# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Car.create( { make: 'Renault', color: 'white', year: 2019, price: 12021 })
Car.create( { make: 'Chevy', color: 'red', year: 2017, price: 1010 } )
Car.create( { make: 'Tesla', color: 'blue', year: 2015, price: 12098 } )
Car.create( { make: 'Audi', color: 'silver', year: 2019, price: 13093 } )
Car.create( { make: 'Nissan', color: 'green', year: 2018, price: 15000 })

User.create( {name: 'admin', email: 'admin@mail.com', password: 'pass123', admin: true} )