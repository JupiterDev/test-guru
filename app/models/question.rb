class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_number_of_answers

  def validate_number_of_answers
    errors.add(:number_of_answers) unless question.answers.count.between?(1,4)
  end
end
