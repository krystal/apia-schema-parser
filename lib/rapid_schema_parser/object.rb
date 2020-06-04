# frozen_string_literal: true

require 'rapid_schema_parser/simple_object'
require 'rapid_schema_parser/has_fields'

module RapidSchemaParser
  class Object < SimpleObject

    include HasFields

  end
end
