class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.bigint :host_id
      t.boolean :is_verified, default: false
      t.bigint :location_id
      t.string :name
      t.string :thumbnail
      t.integer :bed_number
      t.integer :max_guests
      t.float :latitude
      t.float :longtitude
      t.string :address
      t.float :base_price
      t.float :extra_fee
      t.float :rating
      t.boolean :is_archived, default: false

      t.timestamps
    end

    add_index :places, :host_id
    add_index :places, :location_id
  end
end
