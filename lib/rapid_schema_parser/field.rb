# frozen_string_literal: true

require 'rapid_schema_parser/simple_object'
module RapidSchemaParser
  class Field < SimpleObject

    def type
      schema.objects[@raw['type']]
    end

    def null?
      @raw['null'] == true
    end

    def array?
      @raw['array'] == true
    end

  end
end
