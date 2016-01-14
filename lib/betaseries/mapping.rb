module Betaseries
  module Mapping
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def method_missing(method, *args, &block)
      if mapping.has_key?(method)
        key = mapping[method]

        if key.respond_to?(:call)
          key.call(data)
        else
          data[key]
        end
      elsif data.has_key?(method.to_s)
        data[method.to_s]
      else
        super
      end
    end

    def mapping
      {

      }
    end
  end
end
