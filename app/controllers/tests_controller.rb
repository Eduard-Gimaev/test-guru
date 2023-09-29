class TestsController < ApplicationController
  before_action :find_test, only: %i[index]

  def index
    # result = ["Class: #{params.class}", "Paramentrs: #{params.inspect}"]
    # render plain: result.join("\n")
  end

  def show
  end

  def new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      render plain: @test.inspect
    else
      render plain: 'Test has not been created'
    end
  end

  private
  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @tests = Test.all
  end



end
