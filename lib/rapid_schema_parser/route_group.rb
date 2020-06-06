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

    def groups
      @groups ||= @raw['groups'].each_with_object({}) do |group_hash, hash|
        group = RouteGroup.new(@route_set, group_hash)
        hash[group.id] = group
      end
    end

  end
end
