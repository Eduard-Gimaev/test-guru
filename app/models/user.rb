require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, foreign_key: 'author_id', class_name: 'Test'

  has_secure_password

  validates :user, presence: true
  validates :email, presence: true


  def tests_by_level(level)
    tests.where(level:).pluck(:title, :level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
