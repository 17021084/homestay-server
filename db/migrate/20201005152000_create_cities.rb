class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :sub_name
      t.decimal :longitude, precision: 15, scale: 10
      t.decimal :latitude, precision: 15, scale: 10

      t.timestamps
    end
  end
end
