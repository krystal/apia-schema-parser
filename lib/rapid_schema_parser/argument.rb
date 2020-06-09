# frozen_string_literal: true

require 'rapid_schema_parser/simple_object'

module RapidSchemaParser
  class Argument

    def initialize(set, raw)
      @set = set
      @schema = set.schema
      @raw = raw
    end

    def name
      @raw['name']
    end

    def description
      @raw['description']
    end

    def type
      return nil if @raw['type'].nil?

      @schema.objects[@raw['type']]
    end

    def required?
      @raw['required'] == true
    end

    def array?
      @raw['array'] == true
    end

    def default
      @raw['default']
    end

  end
end
