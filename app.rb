require_relative 'module/options'
require_relative 'module/take_input'
require_relative 'controllers/book'
require_relative 'classes/book'
require './classes/person'
require './classes/rental'
require './classes/student'
require './classes/teacher'
require './classes/classroom'
require './decorators/capitalize_decorator'

class App
  attr_reader :books, :people, :rentals

  include Options

  include TakeInput

  def initialize(book_controller, person_controller, _rental_controller)
    @people = []
    @books = []
    @rentals = []

    @book_controller = book_controller
    @person_instance = person_controller
    @rental_instance = nil
  end

  def list_books
    @book_controller.list(@books)
  end

  def create_book
    title = take_input_with_label('Title')
    author = take_input_with_label('Author')
    @book_controller.create(self, Book.new(title, author))
  end

  def list_people
    @person_instance.list(@people)
  end

  def create_person(option)
    name = take_input_with_label('Name')
    age = take_input_with_label('Age').to_i

    case option
    when 1
      specialization = take_input_with_label('Specialization')
      @person_instance.create(self, Teacher.new(specialization, age, name), 'Teacher Created Successfully')
    when 2
      permission = %w[y Y].include?(take_input_with_label('Has parent permission? [Y/N]'))
      @person_instance.create(self, Student.new(age, name, permission), 'Student Created Successfully')
    end
  end

  def take_rental_options(type)
    case type
    when 'book'
      puts "\nSelect a book from the following list by number"
      puts book_controller.list(@books)
      book = take_input_with_label('Book number').to_i
      return puts 'Invalid book selection!' unless book.between?(1, @books.length)

      @books[book - 1]

    when 'person'
      puts "\nSelect a person from the following list by number (not ID)"
      puts @person_instance.list(@people, indexed: true)
      person = take_input_with_label('Person number').to_i
      return puts 'Invalid person selection!' unless person.between?(1, @people.length)

      @people[person - 1]

    else
      puts 'Invalid function call'
    end
  end

  def create_rental
    book = take_rental_options('book')
    person = take_rental_options('person')

    puts 'Enter a date'
    date = take_input_with_label('Date, "DD-MM-YYYY"')
    @rentals << Rental.new(date, person, book)
    puts 'Rental Created Successfully!'
  end

  def rentable?
    puts 'Either books or people is empty. Please add one of each' if @people.empty? || @books.empty?
    !@people.empty? && !@books.empty?
  end

  def take_person_id
    return puts 'No rentals available to check. First create a Rental' if @rentals.empty?

    puts 'Enter Person ID to find rentals:'
    take_input_with_label('Person ID').to_i
  end

  def print_rentals(person_id)
    return puts 'No rentals available to check. First create a Rental' if @rentals.empty?

    person = @people.find { |per| per.id == person_id }
    return puts "No rentals found for Person Id: #{person_id}" if person.nil?

    person.rentals.each do |rental|
      puts "\nDate: #{rental.full_date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
