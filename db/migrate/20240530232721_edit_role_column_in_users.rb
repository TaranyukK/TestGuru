class EditRoleColumnInUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :role
    add_column :users, :type, :string, null: false, default: 'User'
    add_index :users, :type
  end
end
