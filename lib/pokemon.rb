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

    def self.list_pokemon
        pokemon = API.new.get_pokemon_list
        puts pokemon
    end 

    #def self.find_by_id(id)
       # index = id.to_i - 1
       # all[index]
   # end 
    
end