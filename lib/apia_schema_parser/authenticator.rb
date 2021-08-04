# frozen_string_literal: true

require 'apia_schema_parser/simple_object'
require 'apia_schema_parser/has_potential_errors'

module ApiaSchemaParser
  class Authenticator < SimpleObject

    include HasPotentialErrors

    def type
      @raw['type']
    end

  end
end
