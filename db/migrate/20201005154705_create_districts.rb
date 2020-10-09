class CreateDistricts < ActiveRecord::Migration[6.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.decimal :longitude, precision: 15, scale: 10
      t.decimal :latitude, precision: 15, scale: 10
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
