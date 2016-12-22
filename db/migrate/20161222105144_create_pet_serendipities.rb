class CreatePetSerendipities < ActiveRecord::Migration[5.0]
  def change
    create_table :pet_serendipities do |t|
    	t.integer :pet_alias_id, null: false
    	t.datetime :trigger_time, null: false
    	t.integer :reporter, null: false, :limit => 8, default: 5499174

    	t.timestamps
    end

    add_index :pet_serendipities, :pet_alias_id
  end
end
