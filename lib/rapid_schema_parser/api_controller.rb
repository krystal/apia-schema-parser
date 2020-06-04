# frozen_string_literal: true

module RapidSchemaParser
  class APIController

    attr_reader :name
    attr_reader :controller

    def initialize(api, name, controller)
      @api = api
      @name = name
      @controller = controller
    end

    def endpoints
      @endpoints ||= @controller.endpoints.each_with_object({}) do |(name, endpoint), hash|
        hash[name] = ControllerEndpoint.new(self, name, endpoint)
      end
    end

  end
end
