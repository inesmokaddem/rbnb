class Category < ApplicationRecord
  has_many :artists
  validates :name, inclusion: { in: ['Clown', 'Chanteur', 'Humoriste', 'Marionnettes', 'Musicien', 'Danseur', 'Mîme'] }
end
