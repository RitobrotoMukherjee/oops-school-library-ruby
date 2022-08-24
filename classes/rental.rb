require 'date'

class Rental
  attr_reader :person, :book, :full_date

  attr_accessor :date

  def initialize(date, person, book)
    @date = date

    @full_date = Date.parse(@date).strftime('%a %d %b %Y')

    @person = person
    person.rentals.push(self)

    @book = book
    book.rentals.push(self)
  end
end
