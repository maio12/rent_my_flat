# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Review.delete_all
Reservation.delete_all
Apartment.delete_all
User.delete_all

gregory = User.new(first_name: "Gregory", last_name: "Conti", email: "gregory@conti.com", password: "nailingit")
gregory.save!
ginevra = User.new(first_name: "Ginevra", last_name: "Fontes Williams", email: "ginevra@fontes.com", password: "nailingit")
ginevra.save!
patricio = User.new(first_name: "Patricio", last_name: "Galindo", email: "patricio@galindo.com", password: "nailingit")
patricio.save!
antonio = User.new(first_name: "Antonio", last_name: "Maiocchi", email: "antonio@maiocchi.com", password: "nailingit")
antonio.save!

photos = Scraper.api_apartments_photos
address = Scraper.api_apartments_address

greg_apart1 = Apartment.new(title: "Beautiful apartment in Pittsburg", address: address, price: "500$/night", user: gregory, city: "Rome")
greg_apart1.remote_photo_url = photos.sample
greg_apart1.save!
greg_apart2 = Apartment.new(title: "Beautiful apartment in Columbus", address: address, price: "550$/night", user: gregory, photo: Scraper.api_apartments_photos.sample, city: "Milan", remote_photo_url: photos.sample)
greg_apart2.save!
gin_apart1 =Apartment.new(title: "Beautiful apartment in London", address: address, price: "800$/night", user: ginevra, photo: Scraper.api_apartments_photos.sample, city: "Bologna", remote_photo_url: photos.sample)
gin_apart1.save!
gin_apart2 =Apartment.new(title: "Beautiful apartment in Rome", address: address, price: "600$/night", user: ginevra, photo: Scraper.api_apartments_photos.sample, city: "Venezia", remote_photo_url: photos.sample)
gin_apart2.save!

gin_in_greg_apart = Reservation.create(date_in: "02/05/2020", date_out: "10/05/2020", apartment: greg_apart1, user: ginevra)
anto_in_greg_apart = Reservation.create(date_in: "02/01/2020", date_out: "10/01/2020", apartment: greg_apart2 , user: antonio)
greg_in_gin_apart = Reservation.create(date_in: "02/02/2020", date_out: "10/02/2020", apartment: gin_apart1 , user: gregory)
patricio_in_gin_apart = Reservation.create(date_in: "02/03/2020", date_out: "10/03/2020", apartment: gin_apart2, user: patricio)

Review.create(content: "Most amazing apartment ever, will come back!", rating: 5, reservation: gin_in_greg_apart)
Review.create(content: "Beautiful apartment, super cozy and host very nice!", rating: 5, reservation: anto_in_greg_apart)
Review.create(content: "The host was super beautiful!", rating: 5, reservation: greg_in_gin_apart)
Review.create(content: "I agree with Greg, lovely host!", rating: 5, reservation: patricio_in_gin_apart)
