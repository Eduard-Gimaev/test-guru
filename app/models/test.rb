class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :by_category, -> (category_title) {joins(:category).where(categories: { title: category_title }) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }


  def self.category_tests_titles_desc(category)
    by_category(category).order(title: :desc).pluck(:title)
  end

end

