class AddPromotedAndAdvertisedToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :promoted, :boolean, default: false
    add_column :profiles, :advertised, :boolean, default: false
  end
end
