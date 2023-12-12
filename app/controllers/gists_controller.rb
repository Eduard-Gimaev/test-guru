class GistsController < ApplicationController

  def index
  end

  def show
  end

  def create
    @test_passage = TestPassage.find(test_params[:format]) 
    @gist_question = GistQuestionService.new(@test_passage.current_question).call

    if @gist_question.success?
      flash[:notice] = t('.success')
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  def destroy
  end

  private
  
  def test_params
    params.permit(:format)
  end

end
