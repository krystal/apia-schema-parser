# frozen_string_literal: true

require 'rapid_schema_parser/simple_object'
require 'rapid_schema_parser/authenticator'
require 'rapid_schema_parser/controller'
require 'rapid_schema_parser/route_set'

module RapidSchemaParser
  class API < SimpleObject

    def authenticator
      @authenticator ||= schema.objects[@raw['authenticator']]
    end

    def route_set
      @route_set ||= RouteSet.new(schema, @raw['route_set'])
    end

  end
end
