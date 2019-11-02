class Question < ApplicationRecord
  belongs_to :test                             # вопрос может принадежать оному тесту
  has_many :answers, dependent: :destroy       # один вопрос может иметь много ответов
end
