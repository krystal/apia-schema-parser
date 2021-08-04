module ApiaSchemaParser
  class PolymorphOption

    def initialize(schema, raw)
      @schema = schema
      @raw = raw
    end

    def name
      @raw['name']
    end

    def type
      @schema.objects[@raw['type']]
    end

  end
end
