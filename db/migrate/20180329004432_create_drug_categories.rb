class CreateDrugCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :drug_categories do |t|
      t.integer :drug_id
      t.integer :category_id
      
      t.timestamps
    end
    add_index :drug_categories, :drug_id
    add_index :drug_categories, :category_id
  end
end
