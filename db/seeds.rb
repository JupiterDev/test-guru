# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
					 {username: "user1", email: "user1@gmail.com", password: "qwerty"},
					 {username: "user2", email: "user2@gmail.com", password: "qwerty"},
					 {username: "user3", email: "user3@gmail.com", password: "qwerty"},
					 {username: "user4", email: "user4@gmail.com", password: "qwerty"},
					 {username: "user5", email: "user5@gmail.com", password: "qwerty"},
					 {username: "user6", email: "user6@gmail.com", password: "qwerty"},
					 {username: "user7", email: "user7@gmail.com", password: "qwerty"},
					 {username: "user8", email: "user8@gmail.com", password: "qwerty"},
					 {username: "user9", email: "user9@gmail.com", password: "qwerty"},
					 {username: "user10", email: "user10@gmail.com", password: "qwerty"},
					 {username: "user11", email: "user11@gmail.com", password: "qwerty"},
					 {username: "user12", email: "user12@gmail.com", password: "qwerty"},
					 {username: "user13", email: "user13@gmail.com", password: "qwerty"},
					 {username: "user14", email: "user14@gmail.com", password: "qwerty"},
					 {username: "user15", email: "user15@gmail.com", password: "qwerty"},
					 {username: "admin", email: "admin@gmail.com", password: "qwerty"}
					 ])

categories = Category.create!([
							   {title: "ruby"},
							   {title: "python"}
  							  ])

tests = Test.create!([
					 {title: "ruby 1", level: 1, category: categories[0], author: User.last},
					 {title: "ruby 2", level: 2, category: categories[0], author: User.last},
					 {title: "python 1", level: 1, category: categories[1], author: User.last},
					 {title: "python 2", level: 2, category: categories[1], author: User.last}
					])

questions = Question.create!([
							{body: "ruby 1 q1", test: tests[0]},
							{body: "ruby 1 q2", test: tests[0]},
							{body: "ruby 2 q1", test: tests[1]},
							{body: "ruby 2 q1", test: tests[1]},
							{body: "python 1 q1", test: tests[2]},
							{body: "python 1 q2", test: tests[2]},
							{body: "python 2 q1", test: tests[3]},
							{body: "python 2 q2", test: tests[3]}
							])

answers = Answer.create!([
						  {body: "ruby 1 q1 a1", correct: true, question: questions[0]},
						  {body: "ruby 1 q1 a2", correct: false, question: questions[0]},
						  {body: "ruby 1 q2 a1", correct: true, question: questions[1]},
						  {body: "ruby 1 q2 a2", correct: false, question: questions[1]},
						  {body: "ruby 2 q1 a1", correct: true, question: questions[2]},
						  {body: "ruby 2 q1 a2", correct: false, question: questions[2]},
						  {body: "ruby 2 q1 a1", correct: true, question: questions[3]},
						  {body: "ruby 2 q1 a2", correct: false, question: questions[3]},
						  {body: "python 1 q1 a1", correct: true, question: questions[4]},
							{body: "python 1 q1 a2", correct: false, question: questions[4]},
							{body: "python 1 q2 a1", correct: true, question: questions[5]},
							{body: "python 1 q2 a2", correct: false, question: questions[5]},
							{body: "python 2 q1 a1", correct: true, question: questions[6]},
							{body: "python 2 q1 a2", correct: false, question: questions[6]},
							{body: "python 2 q2 a1", correct: true, question: questions[7]},
						  {body: "python 2 q2 a2", correct: false, question: questions[7]}
						])

# selected_tests = TestPassage.create!([
# 									   {user_id: User.first.id, test_id: tests[2].id},
# 									   {user_id: User.first.id, test_id: tests[4].id},
# 									   {user_id: User.first.id, test_id: tests[5].id}
# 									 ])

badges = Badge.create!([
	{title: "Успешно прошел все тесты категории Ruby", pic_url: "https://google.com", rule: "category", criterion: "ruby"},
	{title: "Успешно прошел все тесты категории Python", pic_url: "https://google.com", rule: "category", criterion: "python"},
	{title: "Успешно прошел тест с первого раза", pic_url: "https://google.com", rule: "first_attempt", criterion: ""},
	{title: "Успешно прошел все тесты 1 уровня", pic_url: "https://google.com", rule: "level", criterion: "1"},
	{title: "Успешно прошел все тесты 2 уровня", pic_url: "https://google.com", rule: "level", criterion: "2"},
])
