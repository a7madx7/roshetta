class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.decimal :reputation
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
