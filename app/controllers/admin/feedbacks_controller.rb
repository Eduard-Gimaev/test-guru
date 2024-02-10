class Admin::FeedbacksController < Admin::BaseController
  def index
    @feedbacks = Feedback.all.order(created_at: :desc)
  end
end
