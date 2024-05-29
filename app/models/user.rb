class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy

  has_secure_password

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  def tests_by_level(level)
    tests.where(level: level)
  end

  def tests_user(test)
    tests_users.order(id: :desc).find_by(test: test)
  end
end
