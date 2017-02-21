require "./lib/pokemon_api"

class PokemonRecord < ApplicationRecord

  def self.item_categories
    PokeAPI::Loader.new('item-category').all.map { |record| record["name"] }.sort
  end

  def self.items_by_category(category)
    PokeAPI::Loader.new('item-category').find(category)["items"].map { |record| record["name"] }.sort
  end

  def self.items_by_name_or_category(params)
    return [] if params.nil?
    item_name = PokemonRecord.item_by_name(params["item_name"]) unless params["item_name"].empty?
    return [item_name] unless item_name.nil?
    PokemonRecord.items_by_category(params["category_name"])
  end

  def self.item_by_name(name)
    PokeAPI::Loader.new('item').find(name)["name"]
  end
end