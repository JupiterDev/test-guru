class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :nullify
  has_many :authored_tests, class_name: "Test", foreign_key: "author_id"
  has_many :gists
  has_and_belongs_to_many :badges

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  def active_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end

  def full_name
    return first_name if first_name
    return email if email
  end
end
