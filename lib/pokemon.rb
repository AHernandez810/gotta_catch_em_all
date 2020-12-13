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

    def self.display_pokemons
        menu_table = TTY::Table.new(header: ["Id", "Name"])
        self.all.each.with_index(1) do |poki, i|
            menu_table << ["#{i}".red, "#{poki.name}"]
        end
        puts menu_table.render(:unicode)
    end




    
    
end
#Pokemon.list_pokemon