class Category < ApplicationRecord
	has_many :tests               # в одной категории может быть много тестов
end
