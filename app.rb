require_relative 'config/bootstrap'
require_relative 'module/options'
require_relative 'module/take_input'
require_relative 'models/book'
require_relative 'models/teacher'
require_relative 'models/student'
require_relative 'models/rental'

class App
  attr_reader :books, :people

  include Bootstrap

  include Options

  include TakeInput

  def initialize
    @books = Bootstrap::BOOK_CONTROLLER.list
    @people = Bootstrap::PERSON_CONTROLLER.list
  end

  def create_book
    title = take_input_with_label('Title')
    author = take_input_with_label('Author')
    @books << Book.new(title, author)
    puts 'Book Created Successfully'
  end

  def create_person(option)
    name = take_input_with_label('Name')
    age = take_input_with_label('Age').to_i

    case option
    when 1
      specialization = take_input_with_label('Specialization')
      @people << Teacher.new(specialization, age, name)
      puts 'Teacher Created Successfully'
    when 2
      permission = %w[y Y].include?(take_input_with_label('Has parent permission? [Y/N]'))
      @people << Student.new(age, name, permission)
      puts 'Student Created Successfully'
    end
  end

  def create_rental
    book = take_rental_options('book')
    person = take_rental_options('person')

    puts 'Enter a date'
    date = take_input_with_label('Date, "DD-MM-YYYY"')
    Bootstrap::RENTAL_CONTROLLER.create(Rental.new(date, person, book))
  end

  def take_rental_options(type)
    case type
    when 'book'
      puts "\nSelect a book from the following list by number"
      puts Bootstrap::BOOK_CONTROLLER.print
      book = take_input_with_label('Book number').to_i
      return puts 'Invalid book selection!' unless book.between?(1, @books.length)

      @books[book - 1]

    when 'person'
      puts "\nSelect a person from the following list by number (not ID)"
      puts Bootstrap::PERSON_CONTROLLER.print(indexed: true)
      person = take_input_with_label('Person number').to_i
      return puts 'Invalid person selection!' unless person.between?(1, @people.length)

      @people[person - 1]

    else
      puts 'Invalid function call'
    end
  end

  def print_rentals
    return puts 'No rentals available to check. First create a Rental' unless Bootstrap::RENTAL_CONTROLLER.printable?

    puts 'Enter Person ID to find rentals:'
    person_id = take_input_with_label('Person ID').to_i
    Bootstrap::RENTAL_CONTROLLER.print(person_id)
  end

  def save_data
    Bootstrap::BOOK_CONTROLLER.save(@books)
    Bootstrap::PERSON_CONTROLLER.save(@people)
  end
end
