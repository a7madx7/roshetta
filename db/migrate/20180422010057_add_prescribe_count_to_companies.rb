class AddPrescribeCountToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :prescribe_count, :integer, null: false, default: 0
  end
end
