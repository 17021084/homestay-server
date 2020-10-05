class CreateDistricts < ActiveRecord::Migration[6.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.float :longtitude
      t.float :latitude
      t.bigint :city_id

      t.timestamps
    end

    add_index :districts, :city_id
  end
end
