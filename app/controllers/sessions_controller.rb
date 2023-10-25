class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:path] || tests_path
      
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please or Sing up'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to tests_path
  end
  
end
