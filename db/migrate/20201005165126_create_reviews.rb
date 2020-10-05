class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.bigint :user_id
      t.bigint :place_id
      t.text :detail
      t.integer :rating

      t.timestamps
    end

    add_index :reviews, :user_id
    add_index :reviews, :place_id
    add_index :reviews, [:user_id, :place_id], unique: true
  end
end
