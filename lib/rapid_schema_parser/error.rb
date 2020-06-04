# frozen_string_literal: true

require 'rapid_schema_parser/simple_object'
require 'rapid_schema_parser/has_fields'

module RapidSchemaParser
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
