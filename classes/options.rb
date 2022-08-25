class Options
  def initialize()
    @main_range = (1..7)
    @people_options = (1..2)
  end

  def main_options
    puts "\n\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def person_get_option
    puts 'What you want to create:'
    puts "\nPress 1 to add - A teacher Or Press 2 to add - A student"
    puts 'Press any other key to return to main menu'

    input = gets.chomp
    return "\n#{input} is not a valid input to create a person" unless @people_options.include?(input.to_i)

    input.to_i
  end

  def take_input
    input = gets.chomp
    return "\n#{input} is not a valid input. Please try again" unless @main_range.include?(input.to_i)

    input.to_i
  end

  def take_input_with_label(label)
    print "#{label}: "
    gets.chomp
  end
end
