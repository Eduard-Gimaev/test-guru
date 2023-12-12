class GistQuestionService

  def initialize(question, client: nil)
      @question = question
      @test = @question.test
      @client = client || client_default
  end

  def call
    result = @client.create_gist(gist_params)
  end

  private

  def client_default
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
  end

  def gist_params
    { description: I18n.t('.description', test_title: @test.title),
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
end