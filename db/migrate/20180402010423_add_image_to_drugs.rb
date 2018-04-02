class AddImageToDrugs < ActiveRecord::Migration[5.1]
  def change
    add_column :drugs, :image, :string, null: true, default: 'drug.png'
  end
end
