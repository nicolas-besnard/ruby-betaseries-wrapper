module Betaseries
  class Connection  < Faraday::Connection

    def initialize(type = :default)
      super("https://api.betaseries.com/", {}, &method("#{type}_setup"))
    end

    def default_setup(conn)
      conn.headers = default_headers

      conn.use FaradayMiddleware::FollowRedirects

      conn.request :json # Seems not to work with VCR
      conn.response :json, content_type: /\bjson$/
      conn.adapter Faraday.default_adapter
    end

    def multipart_setup(conn)
      conn.headers = default_headers.except('Content-Type')

      conn.use FaradayMiddleware::FollowRedirects

      conn.request :multipart
      conn.request :url_encoded
      conn.response :json, content_type: /\bjson$/
      conn.adapter Faraday.default_adapter
    end

    def default_headers
      {
        'X-BetaSeries-Key'      => ENV['BETASERIES_API_KEY'],
        'X-BetaSeries-Version'  => "2.4",
        'Accept'                => 'application/json',
        'Content-Type'          => 'application/json'
      }
    end
  end
end
