module Badges
  class AllCategoryRuleSpecification < AbstractRuleSpecification
    def satisfies?
      @tests_user.successful? && @tests_user.user.tests.where(category: @value).uniq.count == Test.where(category: @value).count
    end
  end
end
