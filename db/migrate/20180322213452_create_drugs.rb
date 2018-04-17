class CreateDrugs < ActiveRecord::Migration[5.1]
  def change
    create_table :drugs do |t|
      t.string :name
      t.integer :company_id
      t.integer :country_id
      t.integer :form_id
      t.integer :price_id

      t.boolean :market_available, default: true
      t.text :professional_comment, default: 'Please share your professional comment about this drug with us.'
      t.date :invented_at, default: 10.years.ago.to_date
      t.string :market_status, default: 'patent'

      t.timestamps
    end
  end
end
