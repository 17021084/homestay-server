class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.boolean :is_verified, default: false
      t.string :name
      t.integer :bedroom_number
      t.integer :bathroom_number
      t.integer :max_guests
      t.decimal :latitude, precision: 15, scale: 10
      t.decimal :longitude, precision: 15, scale: 10
      t.string :address
      t.float :base_price
      t.float :extra_fee
      t.float :rating
      t.boolean :is_archived, default: false
      t.references :location, index: true, foreign_key: { to_table: :districts }
      t.references :host, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
