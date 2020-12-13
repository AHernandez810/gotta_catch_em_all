require_relative './environment.rb'
class Pokemon
    attr_accessor :name, :url, :types, :abilities, :weight, :height, :id, :moves, :exp

    @@all = []

    def initialize(name, url)
        self.name = name
        self.url = url
        self.abilities = []
        self.types = []
        self.moves = []
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

    def display_info
        pokemon_table = TTY::Table.new(header: ["Id", "Name", "Types", "Abilities", "Weight", "Height", "Moves", "Exp"])
        pokemon_table << ["#{self.id}".red, "#{self.name}", "#{self.types.join(", ")}", "#{self.abilities.join(", ")}", "#{self.weight}", "#{self.height}", "#{self.moves.join(", ")[0..100]}..", "#{self.exp}"]
        puts pokemon_table.render(:unicode)
    end
    
end
#Pokemon.list_pokemon