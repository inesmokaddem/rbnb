# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user = User.create!(email: "ines@gmail.com", password: "secret")

puts 'Creating 100 fake artists...'
publics = ['Tous public', 'Enfants', 'Adolescents', 'Adultes']
publics.each do |pub|
  Public.create!(label: pub)
end

categories = ['Clown', 'Chanteur', 'Humoriste', 'Marionnettes', 'Musicien', 'Danseur', 'Mîme']
categories.each do |category|
  Category.create!(name: category)
end



50.times do
  Artist.create!(
                name: Faker::Artist.name,
                description: Faker::ChuckNorris.fact,
                address: Faker::Address.street_address,
                hour_rate: (10..100).to_a.sample,
                category_id: (1..7).to_a.sample,
                public_id: (1..4).to_a.sample,
                user_id: user.id
                )
end
