# frozen_string_literal: true

require 'apia_schema_parser/simple_object'
require 'apia_schema_parser/polymorph_option'

module ApiaSchemaParser
  class Polymorph < SimpleObject

    def options
      @options ||= @raw['options'].map { |o| PolymorphOption.new(schema, o) }
    end

  end
end
