class GistsController < ApplicationController
  before_action :set_tests_user, only: :create

  def create
    result = GistQuestionService.new(@tests_user.current_question).call

    flash_options = if result.success?
                      current_user.gists.create!(question: @tests_user.current_question, gist_url: result.gist_url)
                      { notice: t('gist.success', url: helpers.gist_url(result.gist_url)) }
                    else
                      { alert: t('gist.failure') }
                    end

    redirect_to @tests_user, flash_options
  end

  private

  def set_tests_user
    @tests_user = TestsUser.find(params[:tests_user])
  end
end
