class CreateServers < ActiveRecord::Migration[5.0]
  def change
    create_table :servers do |t|
    	t.string :name, null: false
    	t.string :region, null: false
      t.boolean :status
      t.datetime :history

      t.timestamps
    end

    add_index :servers, :name
  end
end
