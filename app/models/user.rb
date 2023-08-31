class User < ApplicationRecord

  #has_many :tests_users
  #has_many :tests, through: :tests_users
  #has_and_belongs_to_many :tests

  def tests_by_level(level)
    PassingTest.joins('JOIN tests ON tests.id = passing_tests.test_id').where(user_id: self.id).where('tests.level = ?', level).pluck(:user_id, :title )
  end
end
