class Badge < ApplicationRecord
	BADGE_RULES = %w[category first_attempt level].freeze

	# has_and_belongs_to_many :users
	has_many :rewards
	has_many :users, through: :rewards

	validates :title, presence: true
	validates :pic_url, presence: true
	validates :rule, inclusion: { in: BADGE_RULES }, uniqueness: { scope: :criterion }
	
	def rules
    BADGE_RULES
  end
end
