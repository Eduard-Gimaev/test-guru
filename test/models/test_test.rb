require "test_helper"

class TestTest < ActiveSupport::TestCase
  def self.test_by_category_desc(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
