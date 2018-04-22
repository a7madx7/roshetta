class AddPrescribeCountToDrugs < ActiveRecord::Migration[5.1]
  def change
    add_column :drugs, :prescribe_count, :integer, null: false, default: 0
  end
end
