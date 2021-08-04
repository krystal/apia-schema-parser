# frozen_string_literal: true

require 'json'
require 'apia_schema_parser/schema'

module ApiaSchemaParser

  def self.load_from_file(path)
    contents = File.read(path)
    json = JSON.parse(contents)
    Schema.new(json)
  end

end
