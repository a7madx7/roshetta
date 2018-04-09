class AddThemeToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :theme, :string, default: 'material'
  end
end
