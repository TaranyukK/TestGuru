class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(author_id: self.id).where(level: level)
  end
end
