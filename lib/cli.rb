#all puts/prints should be in cli class (displaying info)
#user input
require_relative "./environment.rb"
class CLI
    def run
        greeting
        menu
        goodbye
    end

    def greeting
        "Welcome to the world of Pokemon!"
    end

    def menu
      @api = API.new
      @api.get_pokemon_list
      Pokemon.display_pokemons
      puts "Which Pokemon do you want learn more about?"
    end

    def goodbye
        puts "Catch those Pokemon!"
        exit
    end
end
CLI.new.run