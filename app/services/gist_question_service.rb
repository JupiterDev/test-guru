class GistQuestionService

	def initialize(question, client = octokit_client)
		@question = question
		@test = @question.test
		@client = client
	end

	Result = Struct.new(:success?, :html_url)

	def call
		target_gist = @client.create_gist(gist_params)
		Result.new(target_gist.html_url.present?, target_gist.html_url)
	end

	private

	def gist_params
		{
			description: I18n.t('services.gist_question.description', title: @test.title),
			files: {
				'test-guru-question.txt' => {
					content: gist_content
				}
			}
		}
	end

	def gist_content
		content = [@question.body]
		content += @question.answers.pluck(:body)
		content.join("\n")
	end

	def octokit_client
		Octokit::Client.new(access_token: Rails.application.credentials.github_api_key!)
	end

end
