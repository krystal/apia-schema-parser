# frozen_string_literal: true

module RapidSchemaParser
  class Scope

    def initialize(raw)
      @raw = raw
    end

    def name
      @raw['name']
    end

    def description
      @raw['description']
    end

  end
end
