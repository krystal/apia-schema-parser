# frozen_string_literal: true

require 'rapid_schema_parser/field'

module RapidSchemaParser
  module HasFields

    def fields
      @fields ||= @raw['fields'].map { |field| Field.new(schema, field) }
    end

  end
end
