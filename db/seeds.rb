require 'faker'

# puts "Destroy User"
#
# puts "Destroy Artists"
Artist.destroy_all

# puts "Destroy Public"
Public.destroy_all
#
# puts "Destroy categories"
Category.destroy_all
User.destroy_all
#


user = User.create!(email: "diego@gmail.com", password: "secret")

publics = ['Tous public', 'Enfants', 'Adolescents', 'Adultes']
publics.each do |pub|
  Public.create!(label: pub)
end

categories = ['Clown', 'Chanteur', 'Humoriste', 'Marionnettes', 'Musicien', 'Danseur', 'Mîme']
categories.each do |category|
  Category.create!(name: category)
end


20.times do
  a = Artist.new(
                name: Faker::Artist.name,
                description: Faker::ChuckNorris.fact,
                address: Faker::Address.street_address,
                hour_rate: (10..100).to_a.sample,
                category: Category.all.sample,
                public: Public.all.sample,
                user_id: user.id
                )
  url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
  a.remote_photo_url = url
  a.save
end

puts 'Created some fake artists...'
