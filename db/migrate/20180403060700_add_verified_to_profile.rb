class AddVerifiedToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :verified, :boolean, null: false, default: false
  end
end
