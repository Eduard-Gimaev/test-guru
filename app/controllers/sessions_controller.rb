class Users::SessionsController < Devise::SessionsController

  skip_before_action :authenticate_user! 
  
  def new
  end

  def create
    super
    flash[:notice] = "Hi, #{current_user.first_name}!"
    # user = User.find_by(email: params[:email])
    # if user&.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to cookies[:request_page] || tests_path
    # else
    #   flash.now[:alert] = 'Are you a Guru? Verify your Email or Password please or Sing up'
    #   render :new
    # end
    # cookies.delete (:request_page)
  end

  def destroy
    reset_session
    redirect_to tests_path
  end
  
end
