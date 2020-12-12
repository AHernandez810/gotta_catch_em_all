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
        "Which Pokemon do you want to learn more about? Select one below..."
             Pokemon.all.each.with_index(1) do |pokemon, i|
                puts "#{i += 1}. #{pokemon.name}"
             end
        end
    end

    def goodbye
        puts "Catch those Pokemon!"
        exit
    end
end