# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Lobby.destroy_all

puts "Seeding..."

nick = User.create(username: "nick", email: "nick@gmail.com", password: "123456")
roy = User.create(username: "roy", email: "roy@gmail.com", password: "123456")
alex = User.create(username: "Bigpopabeef", email: "alex@gmail.com", password: "123456")

fifa = Lobby.new(title: "fifa")
cod = Lobby.new(title: "cod")
fortnite = Lobby.new(title: "fortnite")

puts "seeding finished"
