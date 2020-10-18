class AddGoogleIdExpiresAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :google_id_expires_at, :datetime
  end
end
