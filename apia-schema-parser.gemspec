# frozen_string_literal: true

require_relative './lib/apia_schema_parser/version'

Gem::Specification.new do |s|
  s.name          = 'apia-schema-parser'
  s.description   = 'A little library for reading Apia Schema files.'
  s.summary       = 'This gem provides tools for reading Apia schema definitions.'
  s.homepage      = 'https://github.com/krystal/apia-schema-parser'
  s.version       = ApiaSchemaParser::VERSION
  s.files         = Dir.glob('VERSION') + Dir.glob('{lib}/**/*')
  s.require_paths = ['lib']
  s.authors       = ['Adam Cooke']
  s.email         = ['adam@k.io']
  s.add_runtime_dependency 'apia', '>= 3.0', '< 4.0'
  s.add_runtime_dependency 'json'
end
