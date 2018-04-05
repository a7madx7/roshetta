class AddSpecialityToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :speciality, :string, null: false, default: 'GP'
  end
end
