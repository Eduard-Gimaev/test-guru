class GistQuestionService

  def initialize(question, client = client_default)
      @question = question
      @test = @question.test
      @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status.to_i.between?(200, 299)
  end

  def delete(gist)
    gist_id = gist.id.to_s
    @client.delete_gist(gist_id)
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
