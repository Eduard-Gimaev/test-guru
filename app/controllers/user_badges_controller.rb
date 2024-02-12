class UserBadgesController < ApplicationController
  def index
    @current_user_badges = current_user.user_badges.order(created_at: :desc)
  end
end
