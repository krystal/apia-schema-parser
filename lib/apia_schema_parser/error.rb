# frozen_string_literal: true

require 'apia_schema_parser/simple_object'
require 'apia_schema_parser/has_fields'

module ApiaSchemaParser
  class Error < SimpleObject

    include HasFields

    def code
      @raw['code']
    end

    def http_status
      @raw['http_status']
    end

  end
end
