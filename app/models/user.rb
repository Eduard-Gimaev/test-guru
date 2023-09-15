class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authored_tests, foreign_key: "author_id", class_name: "Test"


  

  def tests_by_level(level)
    tests.where(level: level).pluck(:title, :level)
  end
end
