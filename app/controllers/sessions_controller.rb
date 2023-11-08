class SessionsController < Devise::SessionsController

  def create
    super
    flash[:info] = "Hello, #{current_user.first_name}"
  end
  
end
