class TimerService

  def initialize(test_passage)
    @test_passage = test_passage
    @test = @test_passage.test
  end

  def time_end
    @test_passage.created_at + @test.timer.minutes
  end

  def time_over?
    @test.timer?&&time_end.past?
  end

end