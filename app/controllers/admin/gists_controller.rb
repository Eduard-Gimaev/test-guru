class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all.order(created_at: :desc)
  end

  def destroy
    gist = Gist.find params[:id]
    gist.destroy
    
    gist_service = GistQuestionService.new(gist.question)
    gist_service.delete(gist)
    
    redirect_to admin_gists_path
  end
end