# frozen_string_literal: true

require 'apia_schema_parser/simple_object'
require 'apia_schema_parser/enum_value'

module ApiaSchemaParser
  class Enum < SimpleObject

    def values
      @values ||= @raw['values'].map { |e| EnumValue.new(e) }
    end

  end
end
