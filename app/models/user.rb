class User < ApplicationRecord
  has_many :selected_tests, dependent: :destroy                        # один пользователь может проходить несколько тестов
  has_many :tests, through: :selected_tests

  has_many :created_tests, class_name: "Test", dependent: :destroy     # автор может создать много тестов

  def active_tests(level)
    tests.where(level: level)
  end
end
