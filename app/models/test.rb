class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :by_category, ->(category) { joins(:category).where(category: { title: category }) }

  def self.category_tests_titles_desc(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end

