# frozen_string_literal: true

require 'rapid_schema_parser/error'

module RapidSchemaParser
  module HasPotentialErrors

    def potential_errors
      @potential_errors ||= @raw['potential_errors'].map { |id| schema.objects[id] }
    end

  end
end
