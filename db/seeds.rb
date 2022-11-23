# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

print "Database cleaning... "
User.destroy_all
puts "done!"

puts "BEFORE seed:"
puts "User count: #{User.count}"
puts "Offer count: #{Offer.count}"

print "Seeding Users... "
user = User.create!(
  email: "toto@toto.com",
  password: "123456"
)
puts "done!"
Offer.create!(
  title: "Scrabble",
  description: "jouer au scrabble... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
  location: "Lausanne",
  hourly_rate: 4,
  user: user
)

print "Seeding Offers... "
Offer.create!(
  title: "Tennis",
  description: "Jouer au tennis... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
  location: "Bern",
  hourly_rate: 5,
  user: user
)

Offer.create!(
  title: "PingPong",
  description: "jouer au pingpong... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
  location: "martiny",
  hourly_rate: 2,
  user: user
)
puts "done!"
puts "AFTER seed:"
puts "User count: #{User.count}"
puts "Offer count: #{Offer.count}"
