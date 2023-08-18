users = User.create!(
  [
    { name: "TED"}
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
    { title: "Ruby General", level: 3, category: categories[0] },
    { title: "Rails Framework", level: 3, category: categories[0] },
    { title: "HTML/CSS/SCSS", level: 1, category: categories[1] }
  ]
)
  
questions = Question.create!(
  [
    { body: "Is everything an object in Ruby?", test: tests[0] },
    { body: "HTML is?", test: tests[2] },
    { body: "CSS is?", test: tests[2] },
    { body: "mobile first is?", test: tests[2] },
    { body: "Rails is?", test: tests[1] }
  ]
)
  
answers = Answer.create!(
  [
    { body: "Yes", question: questions[0], correct: true },
    { body: "markup language", question: questions[1], correct: true },
    { body: "style language", question: questions[2], correct: true },
    { body: "mobile-optimized web design", question: questions[3], correct: true },
    { body: "Fraimwork for rails for rails", question: questions[4], correct: true }
  ]
)
  