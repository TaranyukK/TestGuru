module QuestionsHelper
  def question_header(test)
    "<h1>#{controller.action_name == 'new' ? 'Create New' : 'Edit'} #{test.title} Question</h1>".html_safe
  end
end
