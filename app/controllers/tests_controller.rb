class TestsController < ApplicationController

  before_action :find_tests, only: %i[index]
  before_action :find_test, only: %i[show edit update]

  def index
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render plain: @test.inspect
    end
  end

  def edit 
  end
  
  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit 
    end
  end
  

  private
  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
