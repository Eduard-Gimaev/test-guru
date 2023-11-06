users = User.create!(
  [
    { name: 'Ed', surname: 'Gimaev', email: 'ed@gmail.com', password: '123123', password_confirmation: '123123', user_type: "Admin" },
    { name: 'Adel', surname: 'Gimaeva', email: 'adel@gmail.com', password: '123123', password_confirmation: '123123' }
  ]
)

categories = Category.create!(
  [
    { title: 'Backend' },
    { title: 'Frontend' }
  ]
)

tests = Test.create!(
  [
    { title: 'Ruby General', level: 3, category_id: categories[0].id, author_id: users[0].id },
    { title: 'Rails Framework', level: 3, category_id: categories[0].id, author_id: users[0].id  },
    { title: 'HTML/CSS/SCSS', level: 1, category_id: categories[1].id, author_id: users[0].id }
  ]
)

questions = Question.create!(
  [
    { body: 'Is everything an object in Ruby?', test_id: tests[0].id },
    { body: 'HTML is?', test_id: tests[2].id },
    { body: 'CSS is?', test_id: tests[2].id },
    { body: 'mobile first is?', test_id: tests[2].id },
    { body: 'Rails is?', test_id: tests[1].id }
  ]
)

answers = Answer.create!(
  [
    { body: 'Yes', question_id: questions[0].id, correct: true },
    { body: 'No', question_id: questions[0].id },
    { body: 'Markup language', question_id: questions[1].id, correct: true },
    { body: 'Progamming language', question_id: questions[1].id },
    { body: 'style language', question_id: questions[2].id, correct: true },
    { body: 'Programming language', question_id: questions[2].id },
    { body: 'mobile-optimized web design', question_id: questions[3].id, correct: true },
    { body: 'something to do with phones', question_id: questions[3].id },
    { body: 'Fraimwork for rails for rails', question_id: questions[4].id, correct: true },
    { body: 'Progamming language', question_id: questions[4].id }
  ]
)
