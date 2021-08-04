# frozen_string_literal: true

require 'apia_schema_parser/field'

module ApiaSchemaParser
  module HasFields

    def fields
      @fields ||= @raw['fields'].map { |field| Field.new(schema, field) }
    end

  end
end
