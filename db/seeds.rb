users = User.create!(
  [
    { user: "Ed" }, 
    { user: "David" }, 
    { user: "Adele" }
  ]
)
  
categories = Category.create!(
  [
    { title: "Backend" },
    { title: "Frontend" }
  ]
)
  
tests = Test.create!(
  [
    { title: "Ruby General", level: 3, category_id: categories[0].id },
    { title: "Rails Framework", level: 3, category_id: categories[0].id },
    { title: "HTML/CSS/SCSS", level: 1, category_id: categories[1].id }
  ]
)
  
questions = Question.create!(
  [
    { body: "Is everything an object in Ruby?", test_id: tests[0].id },
    { body: "HTML is?", test_id: tests[2].id },
    { body: "CSS is?", test_id: tests[2].id },
    { body: "mobile first is?", test_id: tests[2].id },
    { body: "Rails is?", test_id: tests[1].id }
  ]
)
  
answers = Answer.create!(
  [
    { body: "Yes", question_id: questions[0].id, correct: true },
    { body: "markup language", question_id: questions[1].id, correct: true },
    { body: "style language", question_id: questions[2].id, correct: true },
    { body: "mobile-optimized web design", question_id: questions[3].id, correct: true },
    { body: "Fraimwork for rails for rails", question_id: questions[4].id, correct: true }
  ]
)


  