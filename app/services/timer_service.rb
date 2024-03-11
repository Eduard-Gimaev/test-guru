class TimerService

  def time_end(test_passage)
    test_passage.created_at + test_passage.test.timer.minutes
  end

  def time_over?(test_passage)
    test_passage.test.timer? && time_end(test_passage).past?
  end

end