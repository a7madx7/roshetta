class AddConcentrationToDrugGeneric < ActiveRecord::Migration[5.1]
  def change
    add_column :drug_generics, :concentration, :decimal
  end
end
