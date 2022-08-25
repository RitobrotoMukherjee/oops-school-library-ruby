require './classes/options'
require './classes/person'
require './classes/book'
require './classes/rental'
require './classes/student'
require './classes/teacher'
require './classes/classroom'
require './decorators/capitalize_decorator'

class App < Options

  def initialize()
    super()
    puts 'Welcome to School Library App!'
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

  def list_people
    return 'No person had been added to the library' unless @people.any?
    text = ''
    @people.each do |person|
      type = person.instance_of?(Student) ? 'Student' : 'Teacher'
      text += "\n[#{type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    text
  end

  def create_person(option)

    name = get_input_with_label('Name')
    age = get_input_with_label('Age').to_i

    case option
    when 1
      specialization = get_input_with_label('Specialization')
      @people << Teacher.new(specialization, age, name)
      puts 'Teacher Created Successfully'
    when 2
      permission = %w[y Y].include?(get_input_with_label('Has parent permission? [Y/N]'))
      @people << Student.new(age, name, permission)
      puts 'Student Created Successfully'
    end
  end
end
