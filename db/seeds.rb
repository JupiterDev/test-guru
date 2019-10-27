# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

answer = Answer.create([{body: "some answer", correct: true}, {body: "some answer#2", correct: false}])

category = Category.create(title: "math")

question = Question.create(body: "some question")

test_var = Test.create(title: "test name", level: "2")

user = User.create(username: "user1")
