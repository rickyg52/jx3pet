class AddSourceServerToServers < ActiveRecord::Migration[5.0]
  def change
    add_column :servers, :source_server_id, :integer
  end
end
