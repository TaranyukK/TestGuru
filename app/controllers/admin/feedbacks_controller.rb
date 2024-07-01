class Admin::FeedbacksController < Admin::BaseController
  before_action :set_feedback, only: %i[show destroy]

  def index
    @feedbacks = Feedback.all
  end

  def show; end

  def destroy
    @feedback.destroy

    redirect_to admin_feedbacks_path
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end
end
