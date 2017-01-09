class AddIndexToGroups < ActiveRecord::Migration[5.0]
  def change
    add_index :groups, :group_num
  end
end
