class BadgesController < ApplicationController 
	
	before_action :authenticate_user!
	
	def index
		@badges = Badge.all
		@given_badges = current_user.badges
	end
end
