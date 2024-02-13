class Admin::UserBadgesController < Admin::BaseController
  def index
    @user_badges = UserBadge.all.order(created_at: :desc)
  end
end
