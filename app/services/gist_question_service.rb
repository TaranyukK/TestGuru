class GistQuestionService

  ResponseObject = Struct.new(:gist_url, :success?)

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    gist = @client.create_gist(gist_params)
    ResponseObject.new(gist.html_url, gist.html_url.present?)
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question.description', title: @test.title),
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(:access_token => ENV.fetch('GITHUB_API_TOKEN'))
  end
end
