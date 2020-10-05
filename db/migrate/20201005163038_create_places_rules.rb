class CreatePlacesRules < ActiveRecord::Migration[6.0]
  def change
    create_join_table :places, :rules do |t|
      t.index :place_id
      t.index :rule_id
    end
  end
end
