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

    def all_potential_errors
      errors = self.respond_to?(:potential_errors) ? self.potential_errors : []
      self.arguments.values.each do |arg|
        next unless arg.type.is_a?(ArgumentSet)

        errors |= arg.type.all_potential_errors
      end
      errors
    end

  end
end
