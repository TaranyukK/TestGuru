class TestsUsersController < ApplicationController
  before_action :set_tests_user, only: [:show, :result, :update]

  def show; end

  def result
    @result = @tests_user.correct_answers_percent
  end

  def update
    @tests_user.accept!(params[:answer_ids])

    if @tests_user.completed?
      redirect_to result_tests_user_path(@tests_user)
    else
      render :show
    end
  end

  private

  def set_tests_user
    @tests_user = TestsUser.find(params[:id])
  end
end
