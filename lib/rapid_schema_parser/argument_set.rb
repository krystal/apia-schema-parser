# frozen_string_literal: true

require 'rapid_schema_parser/simple_object'
require 'rapid_schema_parser/argument'

module RapidSchemaParser
  class ArgumentSet < SimpleObject

    def arguments
      @arguments ||= @raw['arguments'].each_with_object({}) do |a, hash|
        arg = Argument.new(self, a)
        hash[arg.name] = arg
      end
    end

  end
end
