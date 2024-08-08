module Badges
  class FirstTryRuleSpecification < AbstractRuleSpecification
    def satisfies?
      TestsUser.where(test: @tests_user.test, user: @tests_user.user).count == 1 && @tests_user.successful?
    end
  end
end
