require 'digest'

module Betaseries
  module Services
    module Auth
      def auth
        params = {
          login: ENV['BETASERIES_LOGIN'],
          password: Digest::MD5.hexdigest(ENV['BETASERIES_PASSWORD'])
        }

        response = connection.post do |req|
          req.url 'members/auth'
          req.params = params
        end

        puts response.body
      end
    end
  end
end
