# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
							   {title: "math"},
							   {title: "routing and switching"},
							   {title: "backend programming"},
							   {title: "frontend programming"},
  ])

tests_var = Test.create!([
						  {title: "test 1", level: rand(1..5), category_id: categories.sample.id},
						  {title: "test 2", level: rand(1..5), category_id: categories.sample.id},
						  {title: "test 3", level: rand(1..5), category_id: categories.sample.id},
						  {title: "test 4", level: rand(1..5), category_id: categories.sample.id},
						  {title: "test 5", level: rand(1..5), category_id: categories.sample.id},
						  {title: "test 6", level: rand(1..5), category_id: categories.sample.id}
])

question = Question.create!(body: "some question", test_id: tests_var.first.id)

answers = Answer.create!([
						  {body: "some answer", correct: true, question_id: question.id},
						  {body: "some answer#2", correct: false, question_id: question.id}
						])

user = User.create!(username: "user1")

selected_tests = SelectedTest.create!([
									   {user_id: user.id, test_id: tests_var[2].id},
									   {user_id: user.id, test_id: tests_var[4].id},
									   {user_id: user.id, test_id: tests_var[5].id}
									 ])
