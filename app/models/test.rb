class Test < ApplicationRecord

  belongs_to :user
  has_many :test_users
  has_many :users, through: :test_users

  #has_and_belongs_to_many :users

  def self.category_tests_titles_desc(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', category).order(title: :desc).pluck(:title)
  end

end

