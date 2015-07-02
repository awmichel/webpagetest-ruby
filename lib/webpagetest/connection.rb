module Webpagetest
  # Configures and performs connection requests
  module Connection

    ENDPOINT = 'http://www.webpagetest.org/'

    def get_connection(options = nil)
      options = Hashie::Mash.new( {
        request: :url_encoded,
        response: :logger,
        adapter: Faraday.default_adapter,
      } ) if options.nil?

      url = options.url || ENDPOINT

      connection = Faraday.new(url: url) do |faraday|
        faraday.request  options.request if options.request
        faraday.response options.response if options.response
        faraday.adapter  options.adapter if options.adapter
      end
    end
  end
end
