class QuestionsController < ApplicationController
  before_action :set_test, only: [:index, :new, :create]
  before_action :set_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.map(&:body)
  end

  def show
    @question = Question.find(params[:id])

    render plain: @question.body
  end

  def new
  end

  def create
    @question = @test.questions.create(question_params)

    render plain: "Question: '#{@question.body}' created!"
  end

  def destroy
    @question.destroy

    render plain: "Question deleted!"
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render html: "<h1>Not Found</h1>".html_safe, status: :not_found
  end
end
