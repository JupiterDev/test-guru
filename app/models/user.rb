class User < ApplicationRecord
  def active_tests(level)
    Test.joins("JOIN selected_tests ON selected_tests.test_id = tests.id")
        .where(selected_tests: {user_id: id}, tests: {level: level})
  end
end
