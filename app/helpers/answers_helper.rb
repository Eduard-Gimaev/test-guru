module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      "Create a new answer for the question: #{answer.question.body}"
    else
      "Edit an answer for the question: #{answer.question.body}"
    end
  end
end
