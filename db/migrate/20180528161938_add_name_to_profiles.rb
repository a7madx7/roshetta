class AddNameToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :first_name, :string, null: false, default: 'FIRST NAME GOES HERE'
    add_column :profiles, :middle_name, :string, null: true
    add_column :profiles, :last_name, :string, null: false, default: 'LAST NAME GOES HERE'
  end
end
