# frozen_string_literal: true

require 'rapid/field_spec'
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

    def spec
      return :all if @raw['spec']['all'] == true
      return Rapid::FieldSpec.parse(@raw['spec']['spec']) if @raw['spec']['spec']

      nil
    end

  end
end
