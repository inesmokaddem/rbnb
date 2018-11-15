class Artist < ApplicationRecord
  belongs_to :category
  belongs_to :public
  belongs_to :user
  has_many :bookings, dependent: :destroy

  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :hour_rate, presence: true, numericality: {only_integer: true}

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
