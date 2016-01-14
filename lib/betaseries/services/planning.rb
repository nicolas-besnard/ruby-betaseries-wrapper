module Betaseries
  module Services
    module Planning
      def planning_member
        params = {
          id: ENV['BETASERIES_USER_ID'],
          unseen: true,
          month: (Time.now).strftime("%Y-%m")
        }

        response = connection.get do |req|
          req.url '/planning/member'
          req.params = params
        end

        episodes = response.body['episodes']
        episodes.map { |episode| Betaseries::Vo::Episode.new(episode) }
      end
    end
  end
end
