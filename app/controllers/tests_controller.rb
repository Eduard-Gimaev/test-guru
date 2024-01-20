class TestsController < ApplicationController
  before_action :authenticate_user!, only: :start
  before_action :find_tests, only: %i[index start show destroy]
  before_action :find_test, only: %i[start show edit update destroy]
  
  def index
  end

  def start
    if current_user.test_passage(@test).current_question_id.nil?
      flash[:alert] = t('actions.no_questions')
      render :index
    else
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    end
  end

  def show
  end

  private
  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_test_questions
    @test.questions?
  end

end
