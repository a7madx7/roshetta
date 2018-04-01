class CreateGenerics < ActiveRecord::Migration[5.1]
  def change
    create_table :generics do |t|
      t.string :name

      t.timestamps
    end
  end
end
