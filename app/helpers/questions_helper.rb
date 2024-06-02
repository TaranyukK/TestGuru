module QuestionsHelper
  def question_header(question)
    "<h1>#{question.new_record? ? t('helpers.questions.new') : t('helpers.questions.edit')} #{question.test.title} #{t('helpers.questions.question')}</h1>".html_safe
  end
end
