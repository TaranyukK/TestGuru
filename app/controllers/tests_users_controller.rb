class TestsUsersController < ApplicationController
  before_action :set_tests_user, only: %i[show result update gist]

  def show; end

  def result
    @result = @tests_user.correct_answers_percent
  end

  def update
    @tests_user.accept!(params[:answer_ids])

    if @tests_user.completed?
      TestsMailer.completed_test(@tests_user).deliver_now

      redirect_to result_tests_user_path(@tests_user)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@tests_user.current_question).call

    flash_options = if result
                     { notice: t('.success', url: helpers.gist_url(result[:html_url])) }
                   else
                     { alert: t('.failure') }
                   end

    redirect_to @tests_user, flash_options
  end

  private

  def set_tests_user
    @tests_user = TestsUser.find(params[:id])
  end
end
