class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback)
    @admin = Admin.first
    @feedback = feedback

    mail to: @admin.email, subject: t('.subject')
  end
end
