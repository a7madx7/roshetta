class AddImageToInteractions < ActiveRecord::Migration[5.1]
  def change
    add_column :interactions, :image, :string, null: true, default: 'interaction.png'
  end
end
