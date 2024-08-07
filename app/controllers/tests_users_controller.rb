class TestsUsersController < ApplicationController
  before_action :set_tests_user, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @tests_user.accept!(params[:answer_ids])

    if @tests_user.completed?
      BadgeService.new(@tests_user).call
      TestsMailer.completed_test(@tests_user).deliver_now

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
