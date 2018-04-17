class CreateDispenseStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :dispense_statuses do |t|
      t.boolean :pom, default: true, null: false
      t.boolean :otc, default: false, null: false
      t.text :detailed_description, null: true
      t.references :generic, foreign_key: true

      t.timestamps
    end
  end
end
