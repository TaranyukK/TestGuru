users = []
tests = []

{ Alice: 'Cooper', Bob: 'Dylan', Charlie: 'Starr' }.each do |first_name, last_name|
  users << User.create!(first_name: first_name.to_s,
                        last_name: last_name,
                        email: "#{first_name.downcase}@example.com",
                        type: 'User',
                        password: '123456',
                        password_confirmation: '123456'
  )
end

%w[Programming Math].each do |title|
  category = Category.create!(title: title)

  2.times do |i|
    tests << test = Test.create!(
      title: "#{title} Test Level #{i + 1}",
      level: i + 1,
      author_id: users.sample.id,
      category_id: category.id
    )

    5.times do |j|
      question = Question.create!(body: "Question #{j + 1} for #{test.title}", test_id: test.id)

      4.times do |k|
        Answer.create!(body: "Answer #{k + 1} for Question #{j + 1}", correct: k == 0, question_id: question.id)
      end
    end
  end
end

users.each do |user|
  tests.each do |test|
    completed = [true, false].sample

    TestsUser.create!(user_id: user.id, test_id: test.id, completed: completed)
  end
end
