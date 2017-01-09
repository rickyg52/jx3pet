class AddIpAndPortToServer < ActiveRecord::Migration[5.0]
  def change
    add_column :servers, :ip, :string, null: false
    add_column :servers, :port, :integer, null: false
  end
end
