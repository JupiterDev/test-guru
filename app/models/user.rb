class User < ApplicationRecord
  has_many :selected_tests, dependent: :destroy
  has_many :tests, through: :selected_tests

  has_many :created_tests, class_name: "Test", dependent: :destroy

  def active_tests(level)
    tests.where(level: level)
  end
end
