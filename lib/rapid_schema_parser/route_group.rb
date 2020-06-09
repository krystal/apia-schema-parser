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

    def group_path
      @group_path ||= begin
        parts = @raw['id'].split('.')
        last_group = @route_set
        groups = []
        parts.size.times do |i|
          inner_parts = parts[0, i + 1]
          id = inner_parts.join('.')
          group = last_group.groups[id]
          groups << group
          last_group = group
        end
        groups
      end
    end

    def group
      return @group if instance_variable_defined?('@group')

      @group = group_path[group_path.size - 2]
    end

    def groups
      @groups ||= @raw['groups'].each_with_object({}) do |group_hash, hash|
        group = RouteGroup.new(@route_set, group_hash)
        hash[group.id] = group
      end
    end

  end
end
