require_relative 'base_controller'
require_relative '../models/rental'

class RentalController < BaseController
  def print(person_id)
    person = people.find { |per| per.id == person_id }
    return puts "No rentals found for Person Id: #{person_id}" if person.nil?

    person.rentals.each do |rental|
      puts "\nDate: #{rental.full_date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def create(rental)
    rentals = @iostream.read(@file_name)
    rentals << { date: rental.date, full_date: rental.full_date, person: rental.person, book: rental.book }
    @iostream.write(@file_name, rentals)
    puts 'Rental Created Successfully'
  end

  def printable?
    rentals = @iostream.read(@file_name)
    rentals.empty?
  end

  def rentable?
    people = @iostream.read('people.json')
    books = @iostream.read('books.json')
    puts "\nEither books or people is empty. Please add one of each" if people.empty? || books.empty?
    !people.empty? && !books.empty?
  end
end
