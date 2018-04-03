class AddReputationToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :reputation, :decimal
  end
end
