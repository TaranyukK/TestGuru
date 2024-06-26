class TestsController < ApplicationController
  before_action :set_test, only: :start

  def index
    @tests = Test.all
  end

  def start
    current_user.tests << @test

    redirect_to current_user.tests_user(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
