class AddPasswordToRxes < ActiveRecord::Migration[5.1]
  def change
    add_column :rxes, :password, :string, null: false, default: Time.now.year.to_s
  end
end
