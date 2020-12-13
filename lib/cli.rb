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

    def user_interaction
        input = gets.strip.to_i
        if input.between?(1, Pokemon.all.length)
            pokemon = Pokemon.all[input - 1]
            @api.get_pokemon_abilities(pokemon)
            pokemon.display_info
        else
            puts "Entry does not exist. Please try again."
            user_interaction
        end
    end

    def goodbye
        puts "Catch those Pokemon!"
        exit
    end
end
CLI.new.run