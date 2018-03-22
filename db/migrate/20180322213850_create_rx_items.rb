class CreateRxItems < ActiveRecord::Migration[5.1]
  def change
    create_table :rx_items do |t|
      t.integer :drug_id
      t.integer :rx_id
      t.decimal :quantity
      t.decimal :concentration
      t.string :duration
      t.string :unit

      t.timestamps
    end
    add_index :rx_items, :drug_id
    add_index :rx_items, :rx_id
  end
end
