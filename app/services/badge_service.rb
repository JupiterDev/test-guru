class BadgeService
	def initialize(test_passage)
		@test_passage = test_passage
		@test = @test_passage.test
		@user = @test_passage.user
	end

	def check_badges
		Badge.all.select do |badge|
			send(badge.rule, badge.criterion)
		end
	end

	def category(category)
		return unless @test.category.title == category && @test_passage.test_passed?
    Test.tests_titles(category).count == @user.tests.tests_titles(category).uniq.count
	end

	def first_attempt(criterion)
		@user.tests.where(id: @test.id).count == 1 if @test_passage.test_passed?
	end

	def level(level)
		return unless @test.level == level.to_i && @test_passage.test_passed?
		Test.where(level: level).to_ary == @user.tests.where(level: level).uniq
	end
end
