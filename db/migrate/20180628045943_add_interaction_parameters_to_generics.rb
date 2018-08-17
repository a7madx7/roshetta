class AddInteractionParametersToGenerics < ActiveRecord::Migration[5.1]
  def change
    add_column :generics, :induced_by, :string, default: 'UNKNOWN ENZYME NAME'
    add_column :generics, :inhibited_by, :string, default: 'UNKNOWN ENZYME NAME'
    add_column :generics, :inhibits, :string, default: 'UNKNOWN ENZYME NAME'
    add_column :generics, :induces, :string, default: 'UNKNOWN ENZYME NAME'
    add_column :generics, :type, :string, default: 'Prodrug'
  end
end
