class User < ApplicationRecord
  has_many :selected_tests                    # один пользователь может проходить несколько тестов
  has_many :tests, through: :selected_tests   #

  has_many :tests               # автор может создать много тестов

  def active_tests(level)
    Test.joins("JOIN selected_tests ON selected_tests.test_id = tests.id")
        .where(selected_tests: {user_id: id}, tests: {level: level})
  end
end
