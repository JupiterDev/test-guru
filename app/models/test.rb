class Test < ApplicationRecord
  belongs_to :category                # тест имеет одну категорию
  has_and_belongs_to_many :questions  # у одного теста может быть много вопросов

  has_many :selected_tests                   # один тест могут проходит несколько пользователей
  has_many :users, through: :selected_tests  #

  has_one :user                       # тест принадлежит одному автору

	def self.tests_titles(category)
    Test.joins("JOIN categories ON tests.category_id = categories.id")
        .where(categories: {title: category})
        .order(id: :desc)
        .pluck(:title)
  end
end
