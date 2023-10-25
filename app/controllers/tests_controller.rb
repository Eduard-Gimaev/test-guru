class TestsController < ApplicationController
  before_action :find_tests, only: %i[index destroy]
  before_action :find_test, only: %i[start show edit update destroy]
  before_action :find_user, only: :start
  
  def index
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
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
      render :new
    end
  end

  def edit 
  end
  
  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :edit 
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private
  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
