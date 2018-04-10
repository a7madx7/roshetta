class AddRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    # %w[user editor moderator advertiser admin]
    add_column :users, :role, :string, null: false, default: 'user'
  end
end
