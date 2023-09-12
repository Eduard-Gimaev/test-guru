class User < ApplicationRecord
  
  #has_many :tests_users
  #has_many :tests, through: :tests_users

  def tests_by_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id').joins('JOIN users ON users.id = tests_users.user_id').where('user_id = ?', self.id).where('tests.level = ?', level).pluck(:user, :title)
  end
end
