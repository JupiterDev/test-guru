class Test < ApplicationRecord
	def self.tests_titles(category)
    tests.where(category: category).pluck(:title)
  end
end
