class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :mobile_phone, null: false, default: '00'
      t.string :land_line, null: false, default: '00'
      t.string :address
      t.integer :age, null: false, default: 24
      t.string :gender, null: false, default: 'Male'
      t.string :profession, null: false, default: 'Physician'
      t.integer :level, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
