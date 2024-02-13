module BadgesHelper
  def badge_header(badge)
    if badge.new_record?
      t('.create')
    else
      t('.update')
    end
  end
end
