# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Reservation.delete_all
Apartment.delete_all
User.delete_all

gregory = User.create(first_name: "Gregory", last_name: "Conti", email: "gregory@conti.com", password: "nailingit")
ginevra = User.create(first_name: "Ginevra", last_name: "Fontes Williams", email: "ginevra@fontes.com", password: "nailingit")
patricio = User.create(first_name: "Patricio", last_name: "Galindo", email: "patricio@galindo.com", password: "nailingit")
antonio = User.create(first_name: "Antonio", last_name: "Maiocchi", email: "antonio@maiocchi.com", password: "nailingit")

greg_apart1 = Apartment.create(title: "Beautiful apartment in Pittsburg", address: "26 Sarah street", price: "500$/night", user: gregory)
greg_apart2 = Apartment.create(title: "Beautiful apartment in Columbus", address: "62 Frankleen street", price: "550$/night", user: gregory)
gin_apart1 =Apartment.create(title: "Beautiful apartment in London", address: "1 ormonde gate", price: "800$/night", user: ginevra)
gin_apart2 =Apartment.create(title: "Beautiful apartment in Rome", address: "via margutta 54", price: "600$/night", user: ginevra)

Reservation.create(date_in: "02/05/2020", date_out: "10/05/2020", apartment: greg_apart1, user: ginevra)
Reservation.create(date_in: "02/01/2020", date_out: "10/01/2020", apartment: greg_apart2 , user: antonio)
Reservation.create(date_in: "02/02/2020", date_out: "10/02/2020", apartment: gin_apart1 , user: gregory)
Reservation.create(date_in: "02/03/2020", date_out: "10/03/2020", apartment: gin_apart2, user: patricio)

