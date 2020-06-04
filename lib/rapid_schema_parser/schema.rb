# frozen_string_literal: true

require 'rapid_schema_parser/api'
require 'rapid_schema_parser/controller'
require 'rapid_schema_parser/endpoint'
require 'rapid_schema_parser/argument_set'
require 'rapid_schema_parser/authenticator'
require 'rapid_schema_parser/error'
require 'rapid_schema_parser/object'
require 'rapid_schema_parser/enum'
require 'rapid_schema_parser/scalar'
require 'rapid_schema_parser/polymorph'
require 'rapid_schema_parser/lookup_argument_set'

module RapidSchemaParser
  class Schema

    OBJECT_MAP = {
      'api' => API,
      'authenticator' => Authenticator,
      'controller' => Controller,
      'argument_set' => ArgumentSet,
      'endpoint' => Endpoint,
      'error' => Error,
      'object' => Object,
      'enum' => Enum,
      'scalar' => Scalar,
      'polymorph' => Polymorph,
      'lookup_argument_set' => LookupArgumentSet
    }.freeze

    def initialize(raw)
      @raw = raw
    end

    def inspect
      "#<RapidSchemaParser::Schema[#{@raw['api']}] #{@raw['objects'].size} objects>"
    end

    def host
      @raw['host']
    end

    def namespace
      @raw['namespace']
    end

    def api
      objects[@raw['api']]
    end

    def objects
      @raw['objects'].each_with_object({}) do |object, hash|
        klass = OBJECT_MAP[object['type']]
        next if klass.nil?

        hash[object['value']['id']] = klass.new(self, object['value'])
      end
    end

  end
end
