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
					 {username: "admin", email: "admin@gmail.com", password: "qwerty"}
					 ])

categories = Category.create!([
							   {title: "math"},
							   {title: "routing and switching"},
							   {title: "backend programming"},
							   {title: "frontend programming"},
  							  ])

tests = Test.create!([
					 {title: "test 1", level: rand(1..5), category: categories[0], author: User.first},
					 {title: "test 2", level: rand(1..5), category: categories[1], author: User.first},
					 {title: "test 3", level: rand(1..5), category: categories[3], author: User.first},
					 {title: "test 4", level: rand(1..5), category: categories[2], author: User.first},
					 {title: "test 5", level: rand(1..5), category: categories[2], author: User.first},
					 {title: "test 6", level: rand(1..5), category: categories[2], author: User.first}
					])

questions = Question.create!([
							{body: "some question", test: tests[0]},
							{body: "some question", test: tests[1]},
							{body: "some question", test: tests[2]},
							{body: "some question", test: tests[2]}
							])

answers = Answer.create!([
						  {body: "some answer#12", correct: true, question: questions[0]},
						  {body: "some answer#23", correct: false, question: questions[1]},
						  {body: "some answer#84", correct: true, question: questions[2]},
						  {body: "some answer#23", correct: false, question: questions[3]},
						  {body: "some answer#46", correct: true, question: questions[2]},
						  {body: "some answer#73", correct: false, question: questions[1]},
						  {body: "some answer#18", correct: true, question: questions[0]},
						  {body: "some answer#73", correct: false, question: questions[3]},
						  {body: "some answer#82", correct: true, question: questions[0]},
						  {body: "some answer#2", correct: false, question: questions[3]}
						])

selected_tests = TestPassage.create!([
									   {user_id: User.first.id, test_id: tests[2].id},
									   {user_id: User.first.id, test_id: tests[4].id},
									   {user_id: User.first.id, test_id: tests[5].id}
									 ])
