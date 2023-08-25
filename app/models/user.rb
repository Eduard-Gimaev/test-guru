class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  #has_and_belongs_to_many :tests

  def tests_by_level(level)
    Test.where('tests.level = ?', level)
  end
end
