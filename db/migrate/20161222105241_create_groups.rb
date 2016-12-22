class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
    	t.integer :server_id, null: false
    	t.integer :group_num, null: false, :limit => 8
    end	

    add_index :groups, :server_id
  end
end
