module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      t('.create')
    else
      t('.update')
    end
  end
end
