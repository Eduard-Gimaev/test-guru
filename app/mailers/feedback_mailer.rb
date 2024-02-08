class FeedbackMailer < ApplicationMailer
    
    def send_feedback(feedback)
        @user = feedback.user
        @subject = feedback.subject
        @feedback = feedback.feedback

        mail to: 'gimaev.ufa@gmail.com'
    end
end
