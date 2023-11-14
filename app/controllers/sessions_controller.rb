class SessionsController < Devise::SessionsController

  def create
    super
    flash[:info] = t('actions.hello', name: current_user.first_name)
  end
  
end
