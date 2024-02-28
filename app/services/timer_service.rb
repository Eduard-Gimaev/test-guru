class TimerService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def time_end
    @test_passage.created_at + @test.timer
  end

  def time_left
    (time_end - Time.current).to_f
  end

  
  def time_over?
    @test.timer?&&time_end.past?
  end

end