class Test < ApplicationRecord

  belongs_to :author, class_name: "User"
  belongs_to :category
  
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy
  
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

  def admin?
    self.type == "Admin"
  end
end

