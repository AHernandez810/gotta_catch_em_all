require_relative './environment.rb'
class Pokemon
    attr_accessor :name, :type, :evoultion, :ability

    @@all = []

    def initialize(name, type, evoultion, ability)
        @name = name
        @type = type
        @evoultion = evoultion
        @ability = ability
        @@all << self 
    end 
    
    def self.all 
        @@all
    end 

    def self.url(num)
        "https://pokeapi.co/api/v2/pokemon?limit=15/#{num}/"
    end 

    def self.list_pokemon
        (1..15).to_a.each do |num|
            pokemon = API.new.get_all_url(url(num))
            puts "Pokemon: #{num}. #{pokemon['name']}"
            Pokemon.new(pokemon['name'])
        end
    end 

    def to_s
        "Name: #{@name}
        Type: #{@type}
        Evoultion: #{@evoultion}
        Ability: #{@ability}"
    end 

    
    
end
Pokemon.list_pokemon