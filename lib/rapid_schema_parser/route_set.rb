# frozen_string_literal: true

require 'rapid_schema_parser/route_set'
require 'rapid_schema_parser/route_group'
require 'rapid_schema_parser/route'

module RapidSchemaParser
  class RouteSet < SimpleObject

    def routes
      @routes ||= @raw['routes'].map do |route_hash|
        next if route_hash['controller'] =~ /\ARapid\//

        Route.new(self, route_hash)
      end.compact
    end

    def routes_by_group
      @routes_by_group ||= routes.each_with_object({}) do |route, hash|
        hash[route.group&.id] ||= []
        hash[route.group&.id] << route
      end
    end

    def routes_by_endpoint
      @routes_by_endpoint ||= routes.each_with_object({}) do |route, hash|
        hash[route.endpoint&.id] ||= []
        hash[route.endpoint&.id] << route
      end
    end

    def groups
      @groups ||= @raw['groups'].each_with_object({}) do |group_hash, hash|
        group = RouteGroup.new(self, group_hash)
        hash[group.id] = group
      end
    end

  end
end
