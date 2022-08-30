require_relative '../classes/book'
require_relative 'base_controller'

class BookController < BaseController
  def list
    books = iostream.read('books')
    return 'No books added to the library' unless books.any?

    text = ''
    books.each.with_index(1) do |book, i|
      text += "\n#{i}) Title: \"#{book.title}\" Author: #{book.author}"
    end
    text
  end

  def create(app, book)
    app.books << book
    puts 'Book Created Successfully'
  end
end
