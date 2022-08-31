require_relative '../models/book'
require_relative 'base_controller'

class BookController < BaseController
  def print
    data_list = @iostream.read(@file_name)
    return 'No books added to the library' unless data_list.any?

    books = data_list.map { |book| Book.new(book['title'], book['author']) }

    text = ''
    books.each.with_index(1) do |book, i|
      text += "\n#{i}) Title: \"#{book.title}\" Author: #{book.author}"
    end
    text
  end

  def create(book)
    books = @iostream.read(@file_name)
    books << { title: book.title, author: book.author }
    @iostream.write(@file_name, books)
    puts 'Book Created Successfully'
  end

  def list
    data_list = @iostream.read(@file_name)
    return 'No books added to the library' unless data_list.any?

    data_list
  end
end
