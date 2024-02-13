class BadgeService
    include TestsHelper

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def assign_badge
    Badge.all.map do |badge|
        @user.badges << badge if send(badge.rule, badge.rule_params)
    end
    # byebug
  end

  private

  def get_badge_by_category(rule_params)
    category = @test_passage.test.category
    return if rule_params != category.title

    test_ids_by_category = Test.where(category: category).ids
    test_passages = TestPassage.success.where( user_id: @user.id, test_id: test_ids_by_category ).pluck(:test_id).uniq
    test_ids_by_category.count == test_passages.count
  end

  def get_badge_by_first_try(*args)
    test_passages = TestPassage.where(user_id: @user.id, test_id: @test.id)
    test_passages.pluck(:test_id).size == 1 && @test_passage.success == true
  end

  def get_badge_by_level(rule_params)
    return if rule_params.downcase.to_s != test_level(@test).downcase.to_s

    test_ids_by_level = Test.where(level: @test.level).ids
    test_passages = TestPassage.success.where(user_id: @user.id, test_id: test_ids_by_level).pluck(:test_id).uniq

    test_ids_by_level.count == test_passages.count
  end

end