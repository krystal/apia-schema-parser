# frozen_string_literal: true

require 'rapid_schema_parser/simple_object'
require 'rapid_schema_parser/controller_endpoint'

module RapidSchemaParser
  class Controller < SimpleObject

    def authenticator
      return nil if @raw['authenticator'].nil?

      @authenticator ||= schema.objects[@raw['authenticator']]
    end

    def endpoints
      @endpoints ||= @raw['endpoints'].each_with_object({}) do |endpoint, hash|
        hash[endpoint['name']] = schema.objects[endpoint['endpoint']]
      end
    end

  end
end
