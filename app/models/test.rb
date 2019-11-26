class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User"

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :level, numericality: { only_integer: true, 
                                    greater_than_or_equal_to: 0 }
  validates :title, presence: true

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :tests_by_category, -> (category) {joins(:category).where(categories: {title: category}).order(id: :desc)}
end
