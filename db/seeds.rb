users = %w[Alice Bob Charlie].each do |name|
  User.create!(name: name, email: "#{name.downcase}@example.com", role: 0)
end

%w[Programming Math].each do |title|
  category = Category.create!(title: title)

  2.times do |i|
    test = Test.create!(
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
