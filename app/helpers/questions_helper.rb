module QuestionsHelper
  def question_header(question)
    "<h1>#{question.new_record? ? 'Create New' : 'Edit'} #{question.test.title} Question</h1>".html_safe
  end
end
