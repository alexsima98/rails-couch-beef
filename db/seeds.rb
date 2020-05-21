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
Money.destroy_all

puts "Seeding..."

nick = User.create(wallet: 1000, username: "NickTheBeefer", email: "nick@gmail.com", password: "123456", remote_avatar_url: "https://kitt.lewagon.com/placeholder/users/NicholasJardine", psn: "Nicky")
roy = User.create(wallet: 1000, username: "WestBeef", email: "roy@gmail.com", password: "123456", remote_avatar_url: "https://kitt.lewagon.com/placeholder/users/Souyor", psn: "SouyoR")
alex = User.create(wallet: 1000, username: "Beef&Riff", email: "alex@gmail.com", password: "123456", remote_avatar_url: "https://kitt.lewagon.com/placeholder/users/alexsima98", psn: "Sima")
hamza = User.create(wallet: 1000, username: "BigPoppaBeef", email: "hamza@gmail.com", password: "123456", remote_avatar_url: "https://kitt.lewagon.com/placeholder/users/Hamzif", psn: "Hemze")
humbeline = User.create(wallet: 1000, username: "HumBeef", email: "humbeline@gmail.com", password: "123456", remote_avatar_url: "https://kitt.lewagon.com/placeholder/users/humbeline", psn: "Humbi")
claire = User.create(wallet: 1000, username: "BeefnotClaired", email: "claire@gmail.com", password: "123456", remote_avatar_url: "https://kitt.lewagon.com/placeholder/users/claire-gtr", psn: "Clairz")
santi = User.create(wallet: 1000, username: "SantiBeefy", email: "santi@gmail.com", password: "123456", remote_avatar_url: "https://kitt.lewagon.com/placeholder/users/santiagosan93", psn: "Santa")

puts "#{User.all.count} users created"

fifa = Lobby.create(title: "FIFA", photo: "fifa2.png")
cod = Lobby.create(title: "CALL OF DUTY", photo: "cod2.jpg")
fortnite = Lobby.create(title: "FORTNITE", photo: "fortnite.jpg")

puts "#{Lobby.all.count} lobbies created"

session1 = Session.create(user: roy, price: 15, platform: "Playstation 4", lobby: fortnite)
session2 = Session.create(user: nick, price: 20, platform: "Playstation 4", lobby: cod)
session3 = Session.create(user: hamza, price: 300, platform: "Playstation 4", lobby: fifa)
session4 = Session.create(user: alex, price: 20, platform: "Playstation 4", lobby: fifa)
session5 = Session.create(user: roy, price: 5, platform: "Playstation 4", lobby: fifa)
session6 = Session.create(user: nick, price: 50, platform: "Playstation 4", lobby: fifa)
session7 = Session.create(user: humbeline, price: 200, platform: "Playstation 4", lobby: fifa)
session8 = Session.create(user: claire, price: 150, platform: "Playstation 4", lobby: fifa)
session9 = Session.create(user: santi, price: 60, platform: "Playstation 4", lobby: fifa)

puts "#{Session.all.count} sessions created"

UserInvite.create(session: session1, user: nick)
UserInvite.create(session: session2, user: alex)
UserInvite.create(session: session3, user: roy)

puts "#{UserInvite.all.count} UserInvites created"

Money.create(name: "5 euros")
Money.create(name: "10 euros")
Money.create(name: "20 euros")

puts "seeding finished"
