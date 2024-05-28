class AddCurrentQuestionReferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests_users, :current_question, foreign_key: {to_table: :questions}
  end
end
