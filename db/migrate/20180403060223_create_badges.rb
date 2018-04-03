class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :image
      t.references :profile, foreign_key: true
      t.string :condition
      t.string :score
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
