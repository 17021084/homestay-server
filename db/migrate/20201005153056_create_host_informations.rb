class CreateHostInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :host_informations do |t|
      t.boolean :is_super, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
