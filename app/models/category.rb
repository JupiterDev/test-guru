class Category < ApplicationRecord
	has_many :tests, dependent: :nullify    # в одной категории может быть много тестов,
	                                        # внешний ключ будет установлен в NULL при удалении 
end
