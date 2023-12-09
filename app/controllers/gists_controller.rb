class GistsController < ApplicationController

  def index
  end

  def show
  end

  def create
    @test_passage = TestPassage.find(params[:id])
    @result = GistQuestionService.new(@test_passage.current_question).call

    if @result.success?
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
    current_user.gists.build(question: @test_passage.current_question, url: @result.url).save
  end

end
