class ApplicationController < ActionController::Base
  
  helper_method :current_user, 
                :logged_in?  
                
  before_action :authenticate_user!, except: %i[index show ]

  private

  def authenticate_user!
    unless current_user
      cookies[:request_page] = request.fullpath
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
