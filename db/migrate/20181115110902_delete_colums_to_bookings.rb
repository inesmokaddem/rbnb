class DeleteColumsToBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :check_in_at
    remove_column :bookings, :check_out_at

  end
end
