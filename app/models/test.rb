class Test < ApplicationRecord

  scope :by_category, ->(category) { joins(:category).where(category: { title: category }) }

  def self.category_tests_titles_desc(category)
    Test.joins ('JOIN categories ON tests category_id = categories. id')
    Test.order(title: :desc).pluck(:title)
  end

    def self.test_by_category_desc(category)
      Test.order(title: :desc).pluck(:title)
    end
end

:by_category_title, -> (title) {  joins(:category).where('categories.title = ?', title) }