require_relative 'config/bootstrap'
require_relative 'module/options'
require_relative 'module/take_input'
require_relative 'models/book'
require_relative 'models/teacher'
require_relative 'models/student'
require_relative 'models/rental'

class App
  include Bootstrap

  include Options

  include TakeInput

  def create_book
    title = take_input_with_label('Title')
    author = take_input_with_label('Author')
    Bootstrap::BOOK_CONTROLLER.create(Book.new(title, author))
  end

  def create_person(option)
    name = take_input_with_label('Name')
    age = take_input_with_label('Age').to_i

    case option
    when 1
      specialization = take_input_with_label('Specialization')
      Bootstrap::PERSON_CONTROLLER.create(Teacher.new(specialization, age, name), 'Teacher Created Successfully')
    when 2
      permission = %w[y Y].include?(take_input_with_label('Has parent permission? [Y/N]'))
      Bootstrap::PERSON_CONTROLLER.create(Student.new(age, name, permission), 'Student Created Successfully')
    end
  end

  def take_rental_options(type)
    case type
    when 'book'
      puts "\nSelect a book from the following list by number"
      puts Bootstrap::BOOK_CONTROLLER.print
      books = Bootstrap::BOOK_CONTROLLER.list
      book = take_input_with_label('Book number').to_i
      return puts 'Invalid book selection!' unless book.between?(1, books.length)

      books[book - 1]

    when 'person'
      puts "\nSelect a person from the following list by number (not ID)"
      puts Bootstrap::PERSON_CONTROLLER.print(indexed: true)
      people = Bootstrap::PERSON_CONTROLLER.list
      person = take_input_with_label('Person number').to_i
      return puts 'Invalid person selection!' unless person.between?(1, people.length)

      people[person - 1]

    else
      puts 'Invalid function call'
    end
  end

  def create_rental
    book = take_rental_options('book')
    person = take_rental_options('person')

    puts 'Enter a date'
    date = take_input_with_label('Date, "DD-MM-YYYY"')
    @rental_controller.create(self, Rental.new(date, person, book))
  end

  def rentable?
    @rental_controller.rentable?(@books, @people)
  end

  def print_rentals
    return puts 'No rentals available to check. First create a Rental' if @rentals.empty?

    puts 'Enter Person ID to find rentals:'
    person_id = take_input_with_label('Person ID').to_i
    @rental_controller.list(@rentals, @people, person_id)
  end
end
