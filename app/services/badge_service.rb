class BadgeService
  def initialize(tests_user)
    @tests_user = tests_user
    @user = tests_user.user
    @test = tests_user.test
  end

  def call
    Badge.all.select { |badge| send("#{badge.rule}?", badge.option) }.each do |badge|
      @user.badges << badge
    end
  end

  private

  def first_try?(option)
    @user.tests_users.where(test: @test).count == 1 && @tests_user.completed?
  end

  def all_category?(category_title)
    return false unless @tests_user.completed?

    category = Category.find_by(title: category_title)
    return false unless category

    tests_in_category = Test.where(category: category)
    completed_tests_in_category = @user.tests_users.where(test: tests_in_category).select(&:completed?)

    tests_in_category.count == completed_tests_in_category.count
  end

  def all_level?(level)
    return false unless @tests_user.completed?

    tests_of_level = Test.where(level: level)
    completed_tests_of_level = @user.tests_users.where(test: tests_of_level).select(&:completed?)

    tests_of_level.count == completed_tests_of_level.count
  end

  def self.badge_rules
    [ :first_try, :all_category, :all_level ]
  end
end
