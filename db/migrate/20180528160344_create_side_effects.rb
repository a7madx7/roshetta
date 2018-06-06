class CreateSideEffects < ActiveRecord::Migration[5.1]
  def change
    create_table :side_effects do |t|
      t.string :name
      t.string :image
      t.references :generic, foreign_key: true

      t.timestamps
    end
  end
end
