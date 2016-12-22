class CreatePetAlias < ActiveRecord::Migration[5.0]
  def change
    create_table :pet_aliases do |t|
    	t.integer :pet_id, null: false
    	t.string :alias
    	t.integer :server_id
    end

    add_index :pet_aliases, :pet_id
  end
end
