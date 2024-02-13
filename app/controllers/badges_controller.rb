class BadgesController < ApplicationController
  def index
    @badges = Badge.all.order(created_at: :desc)
  end
end
