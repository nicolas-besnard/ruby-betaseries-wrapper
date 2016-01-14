require 'betaseries/connection'
require 'betaseries/services/auth'
require 'betaseries/services/planning'

require 'betaseries/vo/episode'
module Betaseries
  class Service
    include Services::Auth
    include Services::Planning

    def connection(type = :default)
      Connection.new(type)
    end
  end
end
