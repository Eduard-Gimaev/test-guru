class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)
    if @feedback.save
      FeedbackMailer.send_feedback(@feedback).deliver_now
      redirect_to root_path, notice: "Your feedback has been sent."
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:subject, :email, :feedback)
  end
end
