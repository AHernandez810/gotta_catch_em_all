#all puts/prints should be in cli class (displaying info)
#user input
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
    end

    def goodbye
        puts "Catch those Pokemon!"
        exit
    end
end