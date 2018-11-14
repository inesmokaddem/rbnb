require 'faker'

# puts "Destroy User"
# User.destroy_all
#
# puts "Destroy Public"
Public.destroy_all
#
# puts "Destroy categories"
Category.destroy_all
#
# puts "Destroy Artists"
Artist.destroy_all


# user = User.create!(email: "ines@gmail.com", password: "secret")

publics = ['Tous public', 'Enfants', 'Adolescents', 'Adultes']
publics.each do |pub|
  Public.create!(label: pub)
end

categories = ['Clown', 'Chanteur', 'Humoriste', 'Marionnettes', 'Musicien', 'Danseur', 'Mîme']
categories.each do |category|
  Category.create!(name: category)
end


# 20.times do
#   Artist.create!(
#                 name: Faker::Artist.name,
#                 description: Faker::ChuckNorris.fact,
#                 address: Faker::Address.street_address,
#                 hour_rate: (10..100).to_a.sample,
#                 category_id: (1..7).to_a.sample,
#                 public_id: (1..4).to_a.sample,
#                 user_id: user.id
#                 )
# end

puts 'Created some fake artists...'
