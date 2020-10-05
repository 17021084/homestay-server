class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.bigint :user_id
      t.bigint :place_id

      t.timestamps
    end

    add_index :bookmarks, :user_id
    add_index :bookmarks, :place_id
    add_index :bookmarks, [:user_id, :place_id], unique: true
  end
end
