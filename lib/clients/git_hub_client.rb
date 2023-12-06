class GitHubClient
    ROOT_ENDPOINT = 'https://api.github.com'
    ACCESS_TOKEN = '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'
    # ENV['GITHUB_CLIENT_ID'] = 'ВАШ_КЛИЕНТСКИЙ_ID'
    # ENV['GITHUB_CLIENT_SECRET'] = 'ВАШ_СЕКРЕТНЫЙ_КЛЮЧ'




    def initialize
      @http_client = setup_http_client
    end

    def create_gist(params)
        @http_client.post('gists') do |request|
          request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
          request.headers['Content-type'] = 'application/json'
          request.body = params.to_json
        end
    end

    private

    def setup_http_client
        Faraday.new(url: ROOT_ENDPOINT)
    end

end