class AddColumnToTestUsersTable < ActiveRecord::Migration[6.1]
  def change
    add_column :tests_users, :correct_questions, :integer, default: 0
  end
end
