class AddCurrencySymbolToCountries < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :currency_symbol, :string, null: false, default: '£'
    add_column :countries, :currency_name, :string, null: false, default: 'Egyptian Pound'
    add_column :countries, :currency_apprev, :string, null: false, default: 'EGP'

    Country.find_each do |country|
      country.currency_symbol = '£'
      country.currency_name = 'Egyptian Pound'
      country.currency_apprev = 'EGP'
      country.save
    end
  end
end
