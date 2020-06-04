# frozen_string_literal: true

module RapidSchemaParser
  class ControllerEndpoint

    attr_reader :controller
    attr_reader :endpoint

    def initialize(controller, name, endpoint)
      @controller = controller
      @name = name
      @endpoint = endpoint
    end

    def url
      "https://#{controller.controller.schema.host}#{controller.controller.schema.namespace}/#{controller.name}/#{@name}"
    end

  end
end
