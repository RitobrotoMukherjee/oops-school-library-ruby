require_relative '../classes/rental'
require_relative '../interfaces/base'

class RentalController < Base
  def list(rentals, people, person_id)
    return puts 'No rentals available to check. First create a Rental' if rentals.empty?

    person = people.find { |per| per.id == person_id }
    return puts "No rentals found for Person Id: #{person_id}" if person.nil?

    person.rentals.each do |rental|
      puts "\nDate: #{rental.full_date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def create(app, rental)
    app.rentals << rental
    puts 'Rental Created Successfully!'
  end

  def rentable?(books, people)
    puts "\nEither books or people is empty. Please add one of each" if people.empty? || books.empty?
    !people.empty? && !books.empty?
  end
end
