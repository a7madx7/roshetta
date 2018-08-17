class AddRxDefaultPasswordToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rx_default_password, :string, default: 'roshetta'
  end
end
