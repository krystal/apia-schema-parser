# frozen_string_literal: true

require 'rapid_schema_parser/simple_object'
require 'rapid_schema_parser/polymorph_option'

module RapidSchemaParser
  class Polymorph < SimpleObject

    def options
      @options ||= @raw['options'].map { |o| PolymorphOption.new(schema, o) }
    end

  end
end
