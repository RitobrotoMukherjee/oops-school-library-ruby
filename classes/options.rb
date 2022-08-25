class Options
    def options
        puts "\n\nPlease choose an option by entering a number:"
        puts '1 - List all books'
        puts '2 - List all people'
        puts '3 - Create a person'
        puts '4 - Create a book'
        puts '5 - Create a rental'
        puts '6 - List all rentals for a given person id'
        puts '7 - Exit'
    end

    def get_input
        input = gets.chomp.to_i
        return "\n#{input} is not a valid input. Please try again" unless input.include?(range(1..7))
        input
    end


end