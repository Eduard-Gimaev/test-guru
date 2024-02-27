class TimerService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def test_time_allotted
    @test_passage.created_at + @test.timer.minutes
  end
  
  def test_time_over?
    @test.timer?&&test_time_allotted.past?
  end

end