require_relative 'base_controller'
require_relative '../models/rental'

class RentalController < BaseController
  def print(person_id, people)
    person = people.find { |per| per.id == person_id }
    return puts "Person Id: #{person_id} is an invalid person ID" if person.nil?

    return puts "No rentals found for #{person.name}" if person.rentals.empty?

    puts "\nRentals Of #{person.name}(#{person.id})"
    person.rentals.each.with_index(1) do |rental, index|
      puts "#{index}) Date: #{rental.full_date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def list(books, people)
    @iostream.read(@file_name).map do |rental|
      date = rental['date']
      person = people.find { |per| per.id == rental['person_id'] }
      book = books.find { |bk| bk.id == rental['book_id'] }

      Rental.new(date, person, book)
    end
  end

  def rentable?(people, books)
    puts "\nEither books or people is empty. Please add one of each" if people.empty? || books.empty?
    !people.empty? && !books.empty?
  end

  def save(rentals)
    save_obj = rentals.map { |rental| { date: rental.full_date, person_id: rental.person.id, book_id: rental.book.id } }
    @iostream.write(@file_name, save_obj)
  end
end
