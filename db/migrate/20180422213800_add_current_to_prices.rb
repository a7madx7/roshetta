class AddCurrentToPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :prices, :current, :boolean, null: false, default: false

    Price.find_each do |price|
      if price.from_date < Time.now.to_date && price.to_date > Time.now.to_date
        price.current = true
        price.save
      end
    end
  end
end
