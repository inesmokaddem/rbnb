class Public < ApplicationRecord
  has_many :artists
  validates :label, inclusion: { in: ['Tous public', 'Enfants', 'Adolescents', 'Adultes']}
end
