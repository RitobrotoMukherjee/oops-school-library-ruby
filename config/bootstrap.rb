require_relative '../controllers/book'
require_relative '../controllers/person'
require_relative '../controllers/rental'
require_relative '../controllers/io/json_io_controller'

module Bootstrap
  MAIN_MENU_RANGE = (1..7).freeze

  PEOPLE_MENU_RANGE = (1..2).freeze

  JSON_IO = JsonIOController.new

  BOOK_CONTROLLER = BookController.new(JSON_IO, 'books.json')
  PERSON_CONTROLLER = PersonController.new(JSON_IO, 'people.json')
  RENTAL_CONTROLLER = RentalController.new(JSON_IO, 'rentals.json')
end
