class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  
  def index
  end
  
  def show
  end

  def new
  end
  
  def create
    @question = @test.questions.create(question_params)
    if @question.save
      redirect_to @question
    else
      render plain: @question.inspect
    end
  end

  def destroy
    @question.destroy
    redirect_to @questions
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:bodys)
  end
  
  def rescue_question_not_found
    render plain: 'Question was not found'
  end

end
