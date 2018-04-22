class AddPrescribeCountToGenerics < ActiveRecord::Migration[5.1]
  def change
    add_column :generics, :prescribe_count, :integer, null: false, default: 0
  end
end
