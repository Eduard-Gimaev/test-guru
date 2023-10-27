class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:request_page] || tests_path
      
    else
      flash.now[:alert] = ''
      render :new
    end
  end

  def destroy
    reset_session
    cookies.delete :_test_guru_session
    cookies.delete :__profilin
    redirect_to tests_path
  end
  
end
