class QuestionsController < ApplicationController
  before_action :set_test
  before_action :set_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.map(&:body)
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

    render plain: result.join("\n")
  end

  def destroy
    render plain: "Question deleted!"
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = @test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render html: "<h1>Not Found</h1>".html_safe, status: :not_found
  end
end
