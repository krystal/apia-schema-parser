# frozen_string_literal: true

require 'apia_schema_parser/argument_set'
require 'apia_schema_parser/has_potential_errors'

module ApiaSchemaParser
  class LookupArgumentSet < ArgumentSet

    include HasPotentialErrors

  end
end
