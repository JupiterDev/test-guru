class Category < ApplicationRecord
	has_many :tests, dependent: :destroy    # в одной категории может быть много тестов,
	                                        # тесты удаляются при удалении категории
end
