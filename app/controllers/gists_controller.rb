class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find(test_params[:test_passage_id]) 
    @gist_question = GistQuestionService.new(@test_passage.current_question).call
    

    if @gist_question.success?
      create_gist
      flash[:notice] = "#{t('.success')} #{view_context.link_to(t('actions.gist_questions'), @gist_question.url)}".html_safe
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  def destroy
  end

  private

  def test_params
    params.permit(:test_passage_id)
  end

  def create_gist
    # current_user.gists.build(question: @test_passage.current_question, url: @gist_question.url).save
    current_user.gists.create!(question: @test_passage.current_question, url: @gist_question.url)
  end

end
