require 'dotenv'
require 'faraday'
require 'faraday_middleware'
require 'awesome_print'

require 'active_support/core_ext/string/conversions'
require 'active_support/core_ext/date'
require 'active_support/core_ext/numeric/time'

require 'betaseries/mapping'

require 'betaseries/service'

require 'betaseries/version'



Dotenv.load

module Betaseries
  class << self
    def service
      Betaseries::Service.new
    end
  end
end
