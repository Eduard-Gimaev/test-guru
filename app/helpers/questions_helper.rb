module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create a new question for the test: #{question.test.title}"
    else
      "Edit a question for the test: #{question.test.title}"
    end
  end
end
