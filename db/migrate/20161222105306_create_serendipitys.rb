class CreateSerendipitys < ActiveRecord::Migration[5.0]
  def change
    create_table :serendipitys do |t|
    	t.string :name, null: false
    	t.integer :cd
    end
  end
end
