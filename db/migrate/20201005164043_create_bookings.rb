class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.bigint :user_id
      t.bigint :place_id
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.float :total_price

      t.timestamps
    end

    add_index :bookings, :user_id
    add_index :bookings, :place_id
  end
end
