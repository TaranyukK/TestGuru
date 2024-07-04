class TestsUser < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def correct_answers_percent
    (correct_questions.to_f / test.questions.count * 100).round
  end

  def tests_user_timer
    (Time.current - created_at).to_i
  end

  def time_left
    (test.timer * 60) - tests_user_timer
  end

  private

  def correct_answer?(answer_ids)
    !answer_ids.nil? && correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_current_question
    self.current_question = self.current_question.nil? ? test.questions.first : next_question
  end

  def on_time?
    test.timer.zero? || tests_user_timer <= test.timer
  end
end
