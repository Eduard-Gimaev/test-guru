class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result]

  def show
  end

  def update
    @test_passage.choose_answer(params[:answer_ids])
    @test_passage.accept!(params[:answer_ids])
    test_result
  end

  def result
  end
  
  private

  def test_result
    if (@test_passage.has_no_current_question? && !TimerService.new(@test_passage).test_time_over?) || TimerService.new(@test_passage).test_time_over?
      byebug
      assign_success_badge
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    elsif @test_passage.current_question.present? && params[:answer_ids].nil?
      flash[:alert] = t('actions.no_answers')
      render :show
      flash[:alert] = ""
    else
      render :show
    end
  end

  def assign_success_badge
    if @test_passage.success?
        @test_passage.update(success: true) 
        BadgeService.new(@test_passage).assign_badge
    end
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
