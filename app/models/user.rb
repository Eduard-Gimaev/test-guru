class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(level: level).order(title: :desc).pluck(:title)
  end
end
