class BadgeService
	def initialize(test_passage)
		@test_passage = test_passage
		@user = @test_passage.user
	end

	def check_badges
		Badge.all.select do |badge|
			send(badge.rule, badge.criterion)
		end
	end

	def category(category)
		if @test_passage.test.category.title == category && @test_passage.test_passed?
      TestPassage.where(user_id: @user.id, test_id: @test_passage.test.id).count == 1 && Test.tests_titles(category).count == @user.tests.tests_titles(category).uniq.count
    end
	end

	def first_attempt(criterion)
		@user.tests.where(id: @test_passage.test.id).count == 1 if @test_passage.test_passed?
	end

	def level(level)
		if @test_passage.test.level == level.to_i
			Test.where(level: level).to_ary == @user.tests.where(level: level).uniq
		end
	end
end
