# frozen_string_literal: true

module RapidSchemaParser
  class RouteGroup

    def initialize(set, raw)
      @route_set = set
      @raw = raw
    end

    def id
      @raw['id']
    end

    def name
      @raw['name']
    end

    def description
      @raw['description']
    end

    def routes
      @route_set.routes_by_group[id]
    end

    def group
      return @group if instance_variable_defined?('@group')

      @group = begin
        parts = @raw['id'].split('.')
        parts.pop
        source = @route_set.groups
        parts.size.times do |i|
          part = parts[0, i + 1].join('.')

          source = source[part]
          return nil if source.nil?
          return source if i == parts.size - 1

          source = source.groups
        end
        nil
      end
    end

    def groups
      @groups ||= @raw['groups'].each_with_object({}) do |group_hash, hash|
        group = RouteGroup.new(@route_set, group_hash)
        hash[group.id] = group
      end
    end

  end
end
