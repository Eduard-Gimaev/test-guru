class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
  end

  def create
    @test = Test.new(params[:test])
    if @test.save
      redirect_to @test
    else
      render :new 
    end
  end

  def edit 
    @test = Test.find(params[:id])
  end
  
  def update
    @test = Test.find(params[:id])
  
    if @test.updete(test_params)
      redirect_to @test
    else
      render :edit 
    end
  end
  

  private
  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
