class AddPromotedAndAdvertisedToDrugs < ActiveRecord::Migration[5.1]
  def change
    add_column :drugs, :promoted, :boolean, default: false
    add_column :drugs, :advertised, :boolean, default: false
  end
end
