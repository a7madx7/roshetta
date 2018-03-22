class CreateDrugs < ActiveRecord::Migration[5.1]
  def change
    create_table :drugs do |t|
      t.string :name
      t.decimal :price
      t.string :company
      t.boolean :market_available
      t.text :professional_comment
      t.datetime :invented_at
      t.string :market_status

      t.timestamps
    end
  end
end
