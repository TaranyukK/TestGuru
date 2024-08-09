class AddScoreToTestsUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :tests_users, :score, :integer
  end
end
