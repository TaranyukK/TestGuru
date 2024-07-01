class Feedback < ApplicationRecord
  default_scope {order(created_at: :desc)}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :body, presence: true
end
