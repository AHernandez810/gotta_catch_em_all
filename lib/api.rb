require_relative './pokemon'
class API
    def initialize
        @pokemon_url = "https://pokeapi.co/api/v2/pokemon?limit=151"
        @pokemon_abitlity = "https://pokeapi.co/api/v2/ability"
    end 

    def get_pokemon_list
        uri = URI.parse(@pokemon_url)
        response = Net::HTTP.get_response(uri)
        response.body
        data = JSON.parse(response.body)
        data["results"].each do |pokemon_hash|
        #binding.pry
            Pokemon.new(pokemon_hash['name'], pokemon_hash['url'])
        end
    end


    def get_pokemon_abilities
        uri = URI.parse(@pokemon_abitlity)
        resp = Net::HTTP.get(uri)
        data = JSON.parse(resp)
    end

    def get_all_url(pokemon_url)
        response = HTTParty.get(@pokemon_url).parsed_response
    end
end 

#pokemon = API.new.get_pokemon_list
#puts pokemon
