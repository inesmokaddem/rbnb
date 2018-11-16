require 'faker'

# puts "Destroy User"

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

address_type = ["19 Rue Poquelin Molière 33000 Bordeaux", "28 rue des bahutiers 33000 bordeaux", "30 Rue du Commandant Arnould 33000 Bordeaux", "25 Rue des Fours 33800 Bordeaux", "11 Rue Pénicaud 33300 Bordeaux"]

20.times do
  a = Artist.new(
                name: Faker::Artist.name,
                description: Faker::ChuckNorris.fact,
                address: address_type.sample,
                hour_rate: (10..100).to_a.sample,
                category: Category.all.sample,
                public: Public.all.sample,
                user_id: user.id
                )
  url = ["https://images.unsplash.com/photo-1537627856721-321efceec2a2?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e87427673017dd0864e10939bef806ae&auto=format&fit=crop&w=2550&q=80", "https://images.unsplash.com/photo-1509330860649-160543d0d8ae?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=72053dec40958db73c87709f08dc336e&auto=format&fit=crop&w=1352&q=80", "https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9021826916c6592eb3d93e08ca076e29&auto=format&fit=crop&w=2550&q=80", "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b24249de4d2cc572f850669915e72df4&auto=format&fit=crop&w=2550&q=80", "https://images.unsplash.com/photo-1502710655568-ee441b74b0b9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=342ebb2212145f5048fa50adb53064d0&auto=format&fit=crop&w=2550&q=80"]
  a.remote_photo_url = url.sample
  a.save
end

puts 'Created some fake artists...'
