class AddImageToGenerics < ActiveRecord::Migration[5.1]
  def change
    add_column :generics, :image, :string, null: true, default: 'generic.png'
  end
end
