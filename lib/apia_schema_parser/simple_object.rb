# frozen_string_literal: true

module ApiaSchemaParser
  class SimpleObject

    attr_reader :schema

    def initialize(schema, raw)
      @schema = schema
      @raw = raw
    end

    def id
      @raw['id']
    end

    def name
      @raw['name'] || id.split('/').last
    end

    def description
      @raw['description']
    end

  end
end
