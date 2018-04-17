class AddInflationFactorToCountries < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :inflation_factor, :decimal, default: 1.12
  end
end
