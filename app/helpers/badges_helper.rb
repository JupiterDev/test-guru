module BadgesHelper
	def rules
    Badge::BADGE_RULES.map { |rule| [t("badge.rule.#{rule}"), rule] }
  end
end
