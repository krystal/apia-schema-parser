# frozen_string_literal: true

require_relative './lib/rapid_schema_parser/version'

Gem::Specification.new do |s|
  s.name          = 'rapid-schema-parser'
  s.description   = 'A little library for reading Rapid Schema files.'
  s.summary       = 'This gem provides tools for reading Rapid schema definitions.'
  s.homepage      = 'https://github.com/krystal/rapid-schema-parser'
  s.version       = RapidSchemaParser::VERSION
  s.files         = Dir.glob('VERSION') + Dir.glob('{lib}/**/*')
  s.require_paths = ['lib']
  s.authors       = ['Adam Cooke']
  s.email         = ['adam@krystal.uk']
  s.add_runtime_dependency 'json'
end
