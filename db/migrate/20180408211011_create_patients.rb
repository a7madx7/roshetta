class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :social_security_id, null: false
      t.references :rx, foreign_key: true
      t.string :last_dispense_ip

      t.timestamps
    end
  end
end
