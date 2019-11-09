class Test < ApplicationRecord
  belongs_to :category, optional: true
  has_many :questions, dependent: :destroy

  has_many :selected_tests, dependent: :destroy
  has_many :users, through: :selected_tests

  belongs_to :author, class_name: "User"

  validates :level, numericality: { only_integer: true, 
                                    greater_than_or_equal_to: 0 }
  validates :title, presence: true

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :tests_titles, -> (category) {joins(:category).where(categories: {title: category}).order(id: :desc)}
end
