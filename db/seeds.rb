# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserInvite.destroy_all
Session.destroy_all
User.destroy_all
Lobby.destroy_all

puts "Seeding..."

nick = User.create(username: "nick", email: "nick@gmail.com", password: "123456", remote_avatar_url: "https://kitt.lewagon.com/placeholder/users/NicholasJardine")
roy = User.create(username: "roy", email: "roy@gmail.com", password: "123456", remote_avatar_url: "https://kitt.lewagon.com/placeholder/users/Souyor")
alex = User.create(username: "BigPoppaBeef", email: "alex@gmail.com", password: "123456", remote_avatar_url: "https://kitt.lewagon.com/placeholder/users/alexsima98")

puts "#{User.all.count} users created"

fifa = Lobby.create(title: "FIFA", photo: "fifa2.png")
cod = Lobby.create(title: "CALL OF DUTY", photo: "cod2.jpg")
fortnite = Lobby.create(title: "FORTNITE", photo: "fortnite.jpg")

puts "#{Lobby.all.count} lobbies created"

first_session = Session.create(user: roy, price: 15, platform: "Playstation 4", lobby: fifa)
second_session =Session.create(user: nick, price: 20, platform: "Playstation 4", lobby: cod)
third_session = Session.create(user: alex, price: 12, platform: "Playstation 4", lobby: fortnite)

puts "#{Session.all.count} sessions created"

UserInvite.create(session: first_session, user: nick)
UserInvite.create(session: second_session, user: alex)
UserInvite.create(session: third_session, user: roy)

puts "#{UserInvite.all.count} UserInvites created"

puts "seeding finished"
