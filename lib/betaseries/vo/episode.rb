module Betaseries
  module Vo
    class Episode
      include Betaseries::Mapping

      def full_title
        data['show']['title'] + ' ' + code
      end

      def seen?
        data['user']['seen']
      end

      def downloaded?
        data['user']['downloaded']
      end

      # + 1.day because the date is the diffusion date in the US
      def date
        Time.parse(data['date']) + 1.day
      end
    end
  end
end
