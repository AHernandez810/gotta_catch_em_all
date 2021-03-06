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
       puts "Welcome to the world of POKEMON!"
    end

    def menu
      @api = API.new
      Pokemon.all.length == 0 ? @api.get_pokemon_list : nil
      Pokemon.display_pokemons
      puts "Which POKEMON do you want learn more about?"
        user_interaction
        user_decision
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

    def user_decision
        puts "Do you want to look at another POKEMON?(yes/no)"
        input = gets.chomp.downcase
        if input == "yes"
            menu
        elsif input == "no"
            goodbye
        else
            puts "Entry does not exist. Please try again."
            user_decision
        end 
    end

    def goodbye
        puts "Catch those POKEMON!"
        exit
    end
end
CLI.new.run