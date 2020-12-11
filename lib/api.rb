require_relative './environment.rb'
class API
    def initialize
        @pokemon_url = "https://pokeapi.co/api/v2/pokemon"
    end

    def get_pokemons
     uri = URI.parse(@pokemon_url)
     resp = Net::HTTP.get(uri)
     formatted_resp = JSON.parse(resp)
    end
end

pokemon = API.new.get_pokemons
puts pokemon