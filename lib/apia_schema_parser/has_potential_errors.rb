# frozen_string_literal: true

require 'apia_schema_parser/error'

module ApiaSchemaParser
  module HasPotentialErrors

    def potential_errors
      @potential_errors ||= @raw['potential_errors'].map { |id| schema.objects[id] }
    end

  end
end
