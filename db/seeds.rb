users = []
tests = []

admin = Admin.find_or_initialize_by(email: "test@test.com") do |adm|
  adm.first_name = 'Admin'
  adm.last_name = 'Adminovich'
  adm.password = '123456'
  adm.password_confirmation = '123456'
end
admin.skip_confirmation!
admin.save

{ Alice: 'Cooper', Bob: 'Dylan', Charlie: 'Starr' }.each do |first_name, last_name|
  user = User.find_or_initialize_by(email: "#{first_name.downcase}@example.com") do |usr|
    usr.first_name = first_name
    usr.last_name = last_name
    usr.type = 'User'
    usr.password = '123456'
    usr.password_confirmation = '123456'
  end
  user.skip_confirmation!
  user.save
  users << user
end

%w[Programming Math].each do |title|
  category = Category.find_or_create_by!(title: title)

  2.times do |i|
    tests << test = Test.find_or_create_by!(
      title: "#{title} Test Level #{i + 1}",
      level: i + 1,
      author_id: users.sample.id,
      category_id: category.id
    )

    5.times do |j|
      question = Question.find_or_create_by!(body: "Question #{j + 1} for #{test.title}", test_id: test.id)

      4.times do |k|
        Answer.find_or_create_by!(body: "Answer #{k + 1} for Question #{j + 1}", correct: k == 0, question_id: question.id)
      end
    end
  end
end

users.each do |user|
  tests.each do |test|
    completed = [true, false].sample

    TestsUser.find_or_create_by!(user_id: user.id, test_id: test.id) do |tu|
      tu.completed = completed
    end
  end
end
