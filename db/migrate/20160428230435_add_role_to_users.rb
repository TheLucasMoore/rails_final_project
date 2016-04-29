class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, default: 0
  end
end
