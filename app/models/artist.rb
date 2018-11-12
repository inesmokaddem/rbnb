class Artist < ApplicationRecord
  belongs_to :category
  belongs_to :public
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :hour_rate, presence: true, numericality: {only_integer: true}

end
