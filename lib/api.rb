require_relative './environment.rb'
class API
    def initialize
        @pokemon_url = "https://pokeapi.co/api/v2/pokemon?limit=15"
        @pokemon_type = "https://pokeapi.co/api/v2/type?limit=15"
        @pokemon_evolution = "https://pokeapi.co/api/v2/evolution-chain?=limit=15"
        @pokemon_abitlity = "https://pokeapi.co/api/v2/ability?=15"
    end 

    def get_pokemon_list
        uri = URI.parse(@pokemon_url)
        resp = Net::HTTP.get(uri)
        data = JSON.parse(resp)
    end

    def get_pokemon_type
        uri = URI.parse(@pokemon_type)
        resp = Net::HTTP.get(uri)
        data = JSON.parse(resp)
    end

    def get_pokemon_evolution
        uri = URI.parse(@pokemon_evolution)
        resp = Net::HTTP.get(uri)
        data = JSON.parse(resp)
    end 

    def get_pokemon_abilities
        uri = URI.parse(@pokemon_abitlity)
        resp = Net::HTTP.get(uri)
        data = JSON.parse(resp)
    end
end 

pokemon = API.new.get_pokemon_list
puts pokemon

pokemon_type = API.new.get_pokemon_type
puts pokemon_type

pokemon_evolution = API.new.get_pokemon_evolution
puts pokemon_evolution

pokemon_abitlity = API.new.get_pokemon_abilities
puts pokemon_abitlity