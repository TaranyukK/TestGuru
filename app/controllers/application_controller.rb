class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  private

  def rescue_with_question_not_found
    render html: "<h1>Not Found</h1>".html_safe, status: :not_found
  end
end
