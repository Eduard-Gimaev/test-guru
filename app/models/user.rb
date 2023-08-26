class User < ApplicationRecord

  #has_many :tests_users
  #has_many :tests, through: :tests_users
  #has_and_belongs_to_many :tests

  def tests_by_level(level)
    PassingTest.joins('JOIN users ON passing_tests.user_id = users.id').joins('JOIN tests ON passing_tests.test_id = tests.id').where('tests.level = ?', level).pluck(:user, :title, :level)
  end
end
