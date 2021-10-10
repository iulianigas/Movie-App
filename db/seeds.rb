require 'faker'
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Start seeding of movies'
puts '=' * 80

movie = Movie.create(
     title: Faker::Movie.title,
     release_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
     genre: Faker::FunnyName.name,
     description: Faker::Lorem.paragraphs,
     language: Faker::Lorem.word,
     user_id: 1,
     category_id: rand(1...4),
)
movie.movie_image.attach(io: File.open("./app/assets/images/happy.jpg"), filename: "happy.jpg", content_type: 'image/jpg')
movie.save
puts 'End seeding of movies'
puts '=' * 80
