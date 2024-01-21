class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result]

  def show
  end

  def update
    # byebug
    @test_passage.choose_answer(params[:answer_ids])
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.has_no_current_question?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    elsif @test_passage.current_question.present? && params[:answer_ids].nil?
      flash[:alert] = t('actions.no_answers')
      render :show
    else
      render :show
    end
  end

  def result
  end
  
  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
