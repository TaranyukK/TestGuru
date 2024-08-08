class BadgeService
  RULES = {
    first_try: Badges::FirstTryRuleSpecification,
    all_category: Badges::AllCategoryRuleSpecification,
    all_level: Badges::AllLevelRuleSpecification
  }.with_indifferent_access.freeze

  def initialize(tests_user)
    @tests_user = tests_user
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type].new(tests_user: @tests_user, value: badge.rule_value)
      add_badges(badge) if rule.satisfies?
    end
  end

  def add_badges(badge)
    @tests_user.user.badges << badge
  end
end
