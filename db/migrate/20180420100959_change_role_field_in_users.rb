class ChangeRoleFieldInUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :role
    add_column :users, :role_id, :integer
  end

  def down
    add_column :users, :role, :string
    remove_column :users, :role_id
  end
end
