class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  SUCCESS_RATIO = 0.85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.passed = test_passed?
    self.current_question = nil if timeout?
    save!
  end

  def timeout?
    Time.current >= created_at + test.timer.seconds
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def number_of_questions
    test.questions.length
  end

  def number_of_correct_questions
    correct_questions
  end

  def number_of_all_questions
    test.questions.size
  end

  def test_passed?
    correct_questions / test.questions.size >= SUCCESS_RATIO
  end

  def time_left
    (created_at + test.timer * 60 - Time.current).to_i
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first if !current_question.nil?
    end
  end
end
