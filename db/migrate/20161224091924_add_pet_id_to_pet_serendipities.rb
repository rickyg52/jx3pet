class AddPetIdToPetSerendipities < ActiveRecord::Migration[5.0]
  def change
    add_column :pet_serendipities, :pet_id, :integer, :null => false
  	add_column :pet_serendipities, :server_id, :integer, :null => false
  	remove_column :pet_serendipities, :pet_alias_id
  	add_index :pet_serendipities, :pet_id
  	add_index :pet_serendipities, :server_id
  end
end
