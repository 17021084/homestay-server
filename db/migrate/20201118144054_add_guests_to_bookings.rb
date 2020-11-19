class AddGuestsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :guests, :int
  end
end
