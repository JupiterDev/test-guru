class Question < ApplicationRecord
  has_and_belongs_to_many :tests          # вопрос может принадежать нескольким тестам
  has_and_belongs_to_many :answers        # один вопрос может иметь много ответов
end
