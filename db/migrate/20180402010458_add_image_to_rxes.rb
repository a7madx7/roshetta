class AddImageToRxes < ActiveRecord::Migration[5.1]
  def change
    add_column :rxes, :image, :string, null: true, default: 'rx.png'
  end
end
