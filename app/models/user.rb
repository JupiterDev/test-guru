class User < ApplicationRecord
  def active_tests(level)
    tests.where(level: level)
  end
end
