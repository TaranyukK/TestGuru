class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: { greater_than: 0 } }

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, -> (category_title) { joins(:category).where(categories: { title: category_title }) }

  def self.tests_by_category(category_title)
    by_category(category_title).order(id: :desc).pluck(:title)
  end
end
