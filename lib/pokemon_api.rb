require 'faraday'
require "json"

module PokeAPI
  class Loader
    attr_reader :resources
    API_URL = "http://pokeapi.co/api/v2".freeze
    BATCH_SIZE = 50
    RESOURCES = %w(
      item
      item-category
      pokemon
      region
    ).freeze

    def initialize(resource_path)
      @resource_path = resource_path
      @cache = {}
    end

    def find(id)
      request "#{API_URL}/#{@resource_path}/#{id}/"
    end

    def all
      base_url = "#{API_URL}/#{@resource_path}/"
      limit = BATCH_SIZE
      offset = 0
      objects = []
      url = "#{base_url}?limit=#{limit}&offset=#{offset}"

      while url
        begin
          response = request(url)
          objects += response["results"]
          url = response["next"]
        end
      end

      objects
    end

    def self.resources_list
      RESOURCES.sort
    end

    private

    def request(url)
      @cache[url] ||= begin
        response = Faraday.get(url)
        JSON.parse(response.body) if response
      end
    end
  end
end
