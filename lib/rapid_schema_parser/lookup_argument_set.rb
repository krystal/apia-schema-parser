# frozen_string_literal: true

require 'rapid_schema_parser/argument_set'
require 'rapid_schema_parser/has_potential_errors'

module RapidSchemaParser
  class LookupArgumentSet < ArgumentSet

    include HasPotentialErrors

  end
end
