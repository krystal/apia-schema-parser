# frozen_string_literal: true

module ApiaSchemaParser
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
      return nil if @raw['group'].nil?

      parts = @raw['group'].split('.')
      source = @route_set.groups
      parts.size.times do |i|
        part = parts[0, i + 1].join('.')

        source = source[part]
        return nil if source.nil?
        return source if i == parts.size - 1

        source = source.groups
      end
      nil
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
