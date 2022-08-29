require_relative 'module/options'
require_relative 'module/take_input'
require './classes/person'
require './classes/book'
require './classes/rental'
require './classes/student'
require './classes/teacher'
require './classes/classroom'
require './decorators/capitalize_decorator'

class App
  include Options

  include TakeInput

  def initialize()
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    return 'No books added to the library' unless @books.any?

    text = ''
    @books.each.with_index(1) do |book, i|
      text += "\n#{i}) Title: \"#{book.title}\" Author: #{book.author}"
    end
    text
  end

  def list_people(indexed: false)
    return 'No person had been added to the library' unless @people.any?

    text = ''

    @people.each.with_index(1) do |person, i|
      type = person.instance_of?(Student) ? 'Student' : 'Teacher'
      data = "[#{type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"

      text += "\n#{i}) #{data}" if indexed
      text += "\n#{data}" unless indexed
    end

    text
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

  def create_book
    title = take_input_with_label('Title')
    author = take_input_with_label('Author')

    @books << Book.new(title, author)
    puts 'Book Created Successfully'
  end

  def take_rental_options(type)
    case type
    when 'book'
      puts "\nSelect a book from the following list by number"
      puts list_books
      book = take_input_with_label('Book number').to_i
      return puts 'Invalid book selection!' unless book.between?(1, @books.length)

      @books[book - 1]

    when 'person'
      puts "\nSelect a person from the following list by number (not ID)"
      puts list_people(indexed: true)
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
