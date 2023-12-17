class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find params[:test_passage_id]
    gist_service = GistQuestionService.new(@test_passage.current_question)
    @gist_question = gist_service.call
    
    if gist_service.success?
      create_gist
      flash[:notice] = "#{t('.success')} #{view_context.link_to(t('actions.gist_questions'), @gist_question.url)}".html_safe
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def create_gist
    current_user.gists.create(question: @test_passage.current_question, url: @gist_question.url)
  end

end
