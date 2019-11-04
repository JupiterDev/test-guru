class Answer < ApplicationRecord
	belongs_to :question

	validates :body, presence: true
  validate :number_of_answers, on: :create
  
  scope :correct, -> { where(correct: true) }

	def number_of_answers
		errors.add(:question, "can have no more than 4 answers.") if question.answers.count >= 4
	end
end
