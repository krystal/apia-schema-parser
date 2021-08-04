# frozen_string_literal: true

require 'apia_schema_parser/simple_object'
require 'apia_schema_parser/argument'

module ApiaSchemaParser
  class ArgumentSet < SimpleObject

    def arguments
      @arguments ||= @raw['arguments'].each_with_object({}) do |a, hash|
        arg = Argument.new(self, a)
        hash[arg.name] = arg
      end
    end

    def all_potential_errors
      errors = respond_to?(:potential_errors) ? potential_errors : []
      arguments.values.each do |arg|
        next unless arg.type.is_a?(ArgumentSet)

        errors |= arg.type.all_potential_errors
      end
      errors
    end

  end
end
