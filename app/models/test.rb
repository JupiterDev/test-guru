class Test < ApplicationRecord
  belongs_to :category                                      # тест имеет одну категорию
  has_many :questions, dependent: :destroy                  # у одного теста может быть много вопросов

  has_many :selected_tests, , dependent: :destroy           # один тест могут проходит несколько пользователей
  has_many :users, through: :selected_tests

  has_one :author, class_name: "User", dependent: :destroy  # тест принадлежит одному автору

	def self.tests_titles(category)
    Test.joins(:category)
        .where(categories: {title: category})
        .order(id: :desc)
        .pluck(:title)
  end
end
