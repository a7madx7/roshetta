class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.references :drug, foreign_key: true
      t.decimal :value
      t.date :from_date
      t.date :to_date

      t.timestamps
    end
  end
end
