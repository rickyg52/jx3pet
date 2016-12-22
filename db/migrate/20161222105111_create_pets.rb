class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
   		t.string :name, null: false
   		t.integer :min_cd, null: false
   		t.integer :max_cd, null: false
   		t.string :text
    end
  end
end
