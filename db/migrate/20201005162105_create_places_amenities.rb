class CreatePlacesAmenities < ActiveRecord::Migration[6.0]
  def change
    create_join_table :places, :amenities do |t|
      t.index :place_id
      t.index :amenity_id

      t.timestamps
    end
  end
end
