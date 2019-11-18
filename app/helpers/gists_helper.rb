module GistsHelper
	def question_part(gist)
		truncate(gist.question.body, length: 25)
	end

	def gist_hash(url)
		url.split('/').last
	end
end
