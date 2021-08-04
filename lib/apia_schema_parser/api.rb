# frozen_string_literal: true

require 'apia_schema_parser/simple_object'
require 'apia_schema_parser/authenticator'
require 'apia_schema_parser/controller'
require 'apia_schema_parser/route_set'
require 'apia_schema_parser/scope'

module ApiaSchemaParser
  class API < SimpleObject

    def authenticator
      @authenticator ||= schema.objects[@raw['authenticator']]
    end

    def route_set
      @route_set ||= RouteSet.new(schema, @raw['route_set'])
    end

    def scopes
      @scopes ||= @raw['scopes'].map { |s| Scope.new(s) }.sort_by { |s| s.name.upcase }
    end

  end
end
