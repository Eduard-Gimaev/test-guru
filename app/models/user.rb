class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authored_tests, foreign_key: "author_id", class_name: "Test"

  scope :by_level, -> (level) { where(level: level).order(created at: :desc) }
end
