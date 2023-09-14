class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  #scope :by_category, ->(category) { joins(:category).where(category: { title: category }) }

  def self.category_tests_titles_desc(category)
    #by_category(category).order(title: :desc).pluck(:title)
    Test.joins(:category).where(category: { title: category }).order(title: :desc).pluck(:title)
    
    #Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', category).order(title: :desc)
  end
end

