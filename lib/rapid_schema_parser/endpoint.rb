# frozen_string_literal: true

require 'rapid_schema_parser/simple_object'
require 'rapid_schema_parser/has_fields'
require 'rapid_schema_parser/has_potential_errors'
require 'rapid_schema_parser/argument_set'

module RapidSchemaParser
  class Endpoint < SimpleObject

    include HasFields
    include HasPotentialErrors

    def authenticator
      return nil if @raw['authenticator'].nil?

      @authenticator ||= schema.objects[@raw['authenticator']]
    end

    def argument_set
      @argument_set ||= ArgumentSet.new(schema, @raw['argument_set'])
    end

    def http_status
      @raw['http_status']
    end

    def http_method
      @raw['http_method']
    end

    def all_potential_errors
      (self.potential_errors + self.argument_set.all_potential_errors).uniq
    end

  end
end
