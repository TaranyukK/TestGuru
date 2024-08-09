class Badge < ApplicationRecord
  has_many :badges_users
  has_many :users, through: :badges_users

  validates :name, :description, :image_url, :rule_type, :rule_value, presence: true
end
