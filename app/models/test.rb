class Test < ApplicationRecord
  belongs_to :category, optional: true
  has_many :questions, dependent: :destroy

  has_many :selected_tests, dependent: :destroy
  has_many :users, through: :selected_tests

  belongs_to :author, class_name: "User", dependent: :destroy

	def self.tests_titles(category)
    Test.joins(:category)
        .where(categories: {title: category})
        .order(id: :desc)
        .pluck(:title)
  end
end
