class GistsController < ApplicationController

  def index
  end

  def show
  end

  def create
    @test_passage = TestPassage.find(test_params[:format]) 
    @gist_question = GistQuestionService.new(@test_passage.current_question).call

    if @gist_question.success?
      create_gist_question
      flash[:notice] = "#{t('.success')} #{view_context.link_to_created_gist(@result.url)}"
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  def destroy
  end

  private

  def create_gist_question
    current_user.gists.create(question: @test_passage.current_question, url: @gist_question.url).save
  end

  def test_params
    params.permit(:format)
  end

end
