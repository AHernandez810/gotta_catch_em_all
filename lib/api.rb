require_relative "./pokemon"
class API
    def initialize
        @pokemon_url = "https://pokeapi.co/api/v2/pokemon?limit=151"
        @pokemon_ability = "https://pokeapi.co/api/v2/ability"
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


    def get_pokemon_abilities(pokemon)
        #binding.pry
        uri = URI.parse(pokemon.url)
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)
        data["abilities"].each do |ability_hash|
            pokemon.abilities << ability_hash["ability"]["name"]
        end
        pokemon.weight = data["weight"]
        pokemon.height = data["height"]
        pokemon.id = data["id"]
        data["moves"].each do |move_hash|
            pokemon.moves << move_hash["move"]["name"]
        end
        data["types"].each do |type_hash|
            pokemon.types << type_hash["type"]["name"]
        end
        pokemon.exp = data["base_experience"]
    end

    #def get_poki_url
        #response = HTTParty.get(@pokemon_url).parsed_response
   # end

    # def get_ability_url
    #     response = HTTParty.get(@pokemon_ability).parsed_response
    # end
end 

#pokemon = API.new.get_pokemon_list
#puts pokemon
