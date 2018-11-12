class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :artist

  validates :check_in_at, presence: true
  validates :check_out_at, presence: true
end
