module Badges
  class AllLevelRuleSpecification < AbstractRuleSpecification
    def satisfies?
      @tests_user.successful? && @tests_user.user.tests.where(level: @value).uniq.count == Test.where(level: @value).count
    end
  end
end
