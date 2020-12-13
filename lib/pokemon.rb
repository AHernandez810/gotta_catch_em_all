require_relative './environment.rb'
class Pokemon
    attr_accessor :name, :url

    @@all = []

    def initialize(name, url)
        self.name = name
        self.url = url
        self.class.all << self 
    end 
    
    def self.all 
        @@all
    end 




    
    
end
#Pokemon.list_pokemon