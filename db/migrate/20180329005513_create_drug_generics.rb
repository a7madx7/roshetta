class CreateDrugGenerics < ActiveRecord::Migration[5.1]
  def change
    create_table :drug_generics do |t|
      t.integer :drug_id
      t.integer :generic_id
      t.integer :unit_id
      
      t.timestamps
    end
    add_index :drug_generics, :drug_id
    add_index :drug_generics, :category_id
  end
end
