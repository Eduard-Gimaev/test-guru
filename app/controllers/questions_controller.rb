class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]
  
  def index
    render html: '<h2>All questions</h2>'.html_safe
    @questions = @test.questions # does not work
  end
  
  def show
    render html: '<h2>Question found</h2>'.html_safe
  end

  def new
  end
  
  def create
    @question = @test.questions.create(question_params)
    render plain: question.inspect
  end

  def destroy
    @question.destroy
    redirect_to @questions
  end

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
  
  def rescue_question_not_found
    render plain: 'Question was not found'
  end

end
