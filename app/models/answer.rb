class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_answers_count
    errors.add(:number_of_answers, 'should be between 1 and 4') unless question.answers.count < 4
  end
end
