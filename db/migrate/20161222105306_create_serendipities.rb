class CreateSerendipities < ActiveRecord::Migration[5.0]
  def change
    create_table :serendipities do |t|
      t.string :name, null: false
      t.integer :cd
    end
  end
end
