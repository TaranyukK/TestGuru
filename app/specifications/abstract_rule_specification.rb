class AbstractRuleSpecification
  def initialize(value:, tests_user:)
    @value = value
    @tests_user = tests_user
  end

  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end
end
