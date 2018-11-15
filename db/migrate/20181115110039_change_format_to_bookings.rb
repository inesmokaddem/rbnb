class ChangeFormatToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :check_in, :datetime
    add_column :bookings, :check_out, :datetime
  end
end
