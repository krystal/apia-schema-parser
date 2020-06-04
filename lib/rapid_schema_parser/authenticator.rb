# frozen_string_literal: true

require 'rapid_schema_parser/simple_object'
require 'rapid_schema_parser/has_potential_errors'

module RapidSchemaParser
  class Authenticator < SimpleObject

    include HasPotentialErrors

    def type
      @raw['type']
    end

  end
end
