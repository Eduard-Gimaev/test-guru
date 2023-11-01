module TestsHelper
  def test_level(test)
    case test.level
      when 0 then 'Elementary'
      when 1 then 'Intermediate'
      when 2 then 'Advanced'
      when 3 then 'Hard'
      else   'Hero'
    end
  end
end
