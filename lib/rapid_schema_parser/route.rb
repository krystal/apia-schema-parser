# frozen_string_literal: true

module RapidSchemaParser
  class Route

    def initialize(set, raw)
      @route_set = set
      @raw = raw
    end

    def url
      "#{@route_set.schema.url}/#{path}"
    end

    def path
      @raw['path']
    end

    def request_method
      @raw['request_method']
    end

    def group
      @route_set.groups[@raw['group']]
    end

    def controller
      return if @raw['controller'].nil?

      @route_set.schema.objects[@raw['controller']]
    end

    def endpoint
      return if @raw['endpoint'].nil?

      @route_set.schema.objects[@raw['endpoint']]
    end

  end
end
