# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(username: "user1", email: "user@gmail.com")

categories = Category.create!([
							   {title: "math"},
							   {title: "routing and switching"},
							   {title: "backend programming"},
							   {title: "frontend programming"},
  							  ])

tests_var = Test.create!([
						  {title: "test 1", level: rand(1..5), category_id: 1, author_id: 1},
						  {title: "test 2", level: rand(1..5), category_id: 1, author_id: 1},
						  {title: "test 3", level: rand(1..5), category_id: 2, author_id: 1},
						  {title: "test 4", level: rand(1..5), category_id: 2, author_id: 1},
						  {title: "test 5", level: rand(1..5), category_id: 2, author_id: 1},
						  {title: "test 6", level: rand(1..5), category_id: 3, author_id: 1}
						 ])

question = Question.create!([
							{body: "some question", test_id: 2},
							{body: "some question", test_id: 2},
							{body: "some question", test_id: 2},
							{body: "some question", test_id: 1}
							])

answers = Answer.create!([
						  {body: "some answer", correct: true, question_id: 1},
						  {body: "some answer#2", correct: false, question_id: 2}
						])

selected_tests = SelectedTest.create!([
									   {user_id: user.id, test_id: tests_var[2].id},
									   {user_id: user.id, test_id: tests_var[4].id},
									   {user_id: user.id, test_id: tests_var[5].id}
									 ])
