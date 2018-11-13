class Public < ApplicationRecord
  has_many :artists
  validates :label, inclusion: { in: ['Tous public', 'Enfants', 'Adolescents', 'Adultes'] }
  def to_s
    label
  end
end
