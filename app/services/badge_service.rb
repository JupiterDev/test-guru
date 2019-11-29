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

		user_rewards_count = Reward.all.where(user_id: @user.id, badge_id: Badge.find_by(rule: "category", criterion: Category.find_by(id: @test.category_id).title).id).count
		
		tests_by_category = Test.where(category_id: Category.where(title: category)).to_a

		test_passages_by_category = @user.tests.success.where(category_id: Category.find_by(title: category)).to_a

		user_rewards_count.times { tests_by_category.each { |test| test_passages_by_category.delete_at(test_passages_by_category.index(test))} }

		(tests_by_category - test_passages_by_category).empty?

		# Test.tests_by_category(category).count == @user.tests.success.tests_by_category(category).uniq.count
	end

	def first_attempt(criterion)
		@user.tests.where(id: @test.id).count == 1 if @test_passage.test_passed?
	end

	def level(level)
		return unless @test.level == level.to_i && @test_passage.test_passed?

		# Количество наград за тот уровень теста, который прошел пользователь.
		user_rewards_count = Reward.all.where(user_id: @user.id, badge_id: Badge.find_by(rule: "level", criterion: @test.level).id).count
		
		# Тесты с данным уровнем.
		tests_by_level = Test.where(level: level).to_a

		# Пройденные тесты данного уровня.
		test_passages_by_level = @user.tests.success.where(level: level).to_a

		# Удаляем набор тестов данного уровня из пройденных тестов (user_rewards_count раз)
		user_rewards_count.times { tests_by_level.each { |test| test_passages_by_level.delete_at(test_passages_by_level.index(test))} }

		# Проверяем вхождение одного массива в другой
		(tests_by_level - test_passages_by_level).empty?

		# Test.where(level: level).count == @user.tests.success.where(level: level).uniq.count
	end
end
