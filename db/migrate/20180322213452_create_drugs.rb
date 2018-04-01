class CreateDrugs < ActiveRecord::Migration[5.1]
  def change
    create_table :drugs do |t|
      t.string :name
      t.decimal :price
      t.integer :company_id
      t.integer :country_id
      t.integer :form_id
      
      t.boolean :market_available, default: true
      t.text :professional_comment, 'Please share your professional comment about this drug with us.'
      t.datetime :invented_at, default: 10.years.ago
      t.string :market_status, default: 'patent'

      t.timestamps
    end
  end
end
