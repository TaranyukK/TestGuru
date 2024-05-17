class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy

  scope :tests_by_level, -> (level) { where(level: level) }

  validates :email, presence: true, uniqueness: true
end
