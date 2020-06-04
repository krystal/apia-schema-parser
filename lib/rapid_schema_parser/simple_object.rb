# frozen_string_literal: true

module RapidSchemaParser
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
      @raw['name']
    end

    def description
      @raw['description']
    end

  end
end
