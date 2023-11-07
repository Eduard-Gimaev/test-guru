class TestsController < ApplicationController
  before_action :find_tests, only: %i[index]
  before_action :find_test, only: %i[start]
  
  def index
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private
  
  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
