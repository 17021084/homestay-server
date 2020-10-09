class CreateAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :amenities do |t|
      t.string :service_type
      t.string :name

      t.timestamps
    end
  end
end
