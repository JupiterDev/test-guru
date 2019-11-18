module GistsHelper
	def question_part(gist)
		gist.question.body[0..24]
	end

	def gist_hash(url)
		url[24..-1]
	end
end
