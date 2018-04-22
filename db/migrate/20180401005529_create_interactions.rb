class CreateInteractions < ActiveRecord::Migration[5.1]
  def change
    create_table :interactions do |t|
      t.integer :first_drug, null: false
      t.integer :second_drug, null: false
      t.string :title
      t.text :description
      t.string :level
      t.boolean :is_deadly
      t.string :avoid_by

      t.timestamps
    end
    add_index :interactions, :first_drug
    add_index :interactions, :second_drug
  end
end
