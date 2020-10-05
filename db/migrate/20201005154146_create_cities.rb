class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :sub_name
      t.float :longtitude
      t.float :latitude

      t.timestamps
    end
  end
end
