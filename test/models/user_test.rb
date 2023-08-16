require "test_helper"

class UserTest < ActiveSupport::TestCase
  def tests_by_level(level)
    tests.where(level: level)
  end
end
