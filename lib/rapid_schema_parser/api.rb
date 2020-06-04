# frozen_string_literal: true

require 'rapid_schema_parser/simple_object'
require 'rapid_schema_parser/authenticator'
require 'rapid_schema_parser/controller'
require 'rapid_schema_parser/api_controller'

module RapidSchemaParser
  class API < SimpleObject

    def authenticator
      @authenticator ||= schema.objects[@raw['authenticator']]
    end

    def controllers
      @controllers ||= @raw['controllers'].each_with_object({}) do |controller, hash|
        hash[controller['name']] = APIController.new(schema, controller['name'], schema.objects[controller['controller']])
      end
    end

  end
end
