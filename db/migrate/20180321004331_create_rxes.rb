class CreateRxes < ActiveRecord::Migration[5.1]
  def change
    create_table :rxes do |t|
      t.datetime :expires_at
      t.decimal :total_value
      t.integer :dispensed_count
      t.integer :patient_id
      t.integer :dispenser_id
      t.integer :issuer_id
      t.string :short_diagnosis
      t.text :full_diagnosis
      t.integer :allowed_dispense_count
      t.string :status
      t.string :visibility
      t.string :picture
      t.boolean :expired
      t.text :professional_comment
      t.datetime :starts_at

      t.timestamps
    end
    add_index :rxes, :patient_id
    add_index :rxes, :issuer_id
  end
end
