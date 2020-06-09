# frozen_string_literal: true

require 'rapid_schema_parser/simple_object'
require 'rapid_schema_parser/enum_value'

module RapidSchemaParser
  class Enum < SimpleObject

    def values
      @values ||= @raw['values'].map { |e| EnumValue.new(e) }
    end

  end
end
