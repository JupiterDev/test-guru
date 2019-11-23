class Badge < ApplicationRecord
	has_and_belongs_to_many :users

	validates :title, presence: true
	validates :pic_url, presence: true
end
