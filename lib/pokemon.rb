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

    def pokemon_url
        "https://pokeapi.co/api/v2/pokemon/#{num}"
    end
end