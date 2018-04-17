class AddMolecularWeightToGenerics < ActiveRecord::Migration[5.1]
  def change
    add_column :generics, :molecular_weight, :decimal, default: 0.0
    add_column :generics, :molecular_weight_unit, :string, default: 'molar'
  end
end
