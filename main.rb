# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

require_relative 'app'
require_relative 'controllers/book'
require_relative 'controllers/person'
require_relative 'controllers/rental'
require_relative 'controllers/json_io_controller'

JSON_IO = JsonIOController.new('books.json', 'people.json', 'rentals.json')

BOOK_CONTROLLER = BookController.new(JSON_IO)
PERSON_CONTROLLER = PersonController.new(JSON_IO)
RENTAL_CONTROLLER = RentalController.new(JSON_IO)

def main(app)
  puts 'Welcome to School Library CLI App by Ritobroto Mukherjee'
  input = nil

  while input != 7
    app.main_options
    input = app.take_input(Options::MAIN_MENU_RANGE)

    case input

    when 1
      puts "\n#{app.list_books}"

    when 2
      puts "\n#{app.list_people}"

    when 3
      app.person_get_option
      option = app.take_input(Options::PEOPLE_MENU_RANGE, 'Cannot create person')
      app.create_person(option) unless option.is_a? String
      puts option if option.is_a? String
    when 4
      app.create_book
    when 5
      app.create_rental if app.rentable?

    when 6
      app.print_rentals
    else
      puts input unless input == 7
    end
  end

  return puts "\nGoodBye" if input == 7
end

app = App.new(BookController.new, PersonController.new, RentalController.new)

main app

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
