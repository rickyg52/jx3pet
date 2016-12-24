class CreateServers < ActiveRecord::Migration[5.0]
  def change
    create_table :servers do |t|
    	t.string :name, null: false
    	t.string :region, null: false
    end

    add_index :servers, :name
  end
end
