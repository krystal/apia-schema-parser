# frozen_string_literal: true

require 'apia_schema_parser/simple_object'
require 'apia_schema_parser/has_fields'

module ApiaSchemaParser
  class Object < SimpleObject

    include HasFields

  end
end
