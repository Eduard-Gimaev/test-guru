class Test < ApplicationRecord
  belongs_to :category
  #belongs_to :user

  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  

  
  def self.category_tests_titles_desc(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', category).order(title: :desc)
  end

end

