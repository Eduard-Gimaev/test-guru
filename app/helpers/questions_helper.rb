module QuestionsHelper
  def question_header(question)
    if question.new_record?
      t('.create')
    else
      t('.update')
    end
  end
end
