class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.string :access_token, null: false
      t.string :app_name
      t.boolean :active, default: true
      t.date :expiry, null: true

      t.timestamps null: false
    end

    add_index :api_keys, :access_token, unique: true
  end
end
