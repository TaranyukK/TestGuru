class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      FeedbacksMailer.send_feedback(@feedback).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :body)
  end
end
