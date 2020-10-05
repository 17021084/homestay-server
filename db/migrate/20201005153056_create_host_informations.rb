class CreateHostInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :host_informations do |t|
      t.boolean :is_super, default: false
      t.bigint :user_id

      t.timestamps
    end

    add_index :host_informations, :user_id
  end
end
