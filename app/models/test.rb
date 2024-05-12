class Test < ApplicationRecord
  belongs_to :category

  def self.tests_by_category(category_title)
    self.joins(:category).where(categories: {title: category_title}).order(id: :desc).pluck(:title)
  end
end
