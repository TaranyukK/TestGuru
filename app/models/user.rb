class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id').where('user_id = ? AND level = ?', self.id, level)
  end
end
