class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(user_id: id).where(level: level).order(title: :desc).pluck(:user_id, :title)
  end
end
