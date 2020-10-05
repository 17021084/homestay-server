class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :google_id, null: true
      t.string :full_name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.boolean :is_host, default: false
      t.string :address

      t.timestamps
    end
  end
end
