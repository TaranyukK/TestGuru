# Preview all emails at http://localhost:3000/rails/mailers/feedbacks_mailer
class FeedbacksMailerPreview < ActionMailer::Preview

  def send_feedback
    feedback = Feedback.new(author: User.first, body: "This is my feedback")

    FeedbacksMailer.send_feedback(feedback)
  end
end
