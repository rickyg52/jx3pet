class CreateBlacklists < ActiveRecord::Migration[5.0]
  def change
    create_table :blacklists do |t|
    	t.integer :qq_num, null: false, :limit => 8
    	t.timestamp
    end
  end
end
