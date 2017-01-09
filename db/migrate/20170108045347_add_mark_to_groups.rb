class AddMarkToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :mark, :string, null: false, default: '502'
  end
end
