class AddPromotedAndAdvertisedToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :promoted, :boolean, default: false
    add_column :companies, :advertised, :boolean, default: false
  end
end
