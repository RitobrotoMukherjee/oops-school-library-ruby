require_relative '../models/book'
require_relative 'base_controller'

class BookController < BaseController
  def print(books)
    return 'No books added to the library' unless books.any?

    text = ''
    books.each.with_index(1) do |book, i|
      text += "\n#{i}) Title: \"#{book.title}\" Author: #{book.author}"
    end
    text
  end

  def list
    @iostream.read(@file_name).map do |book|
      obj = Book.new(book['title'], book['author'])
      obj.id = book['id']
      obj
    end
  end

  def save(books)
    save_obj = books.map { |book| { id: book.id, title: book.title, author: book.author } }
    @iostream.write(@file_name, save_obj)
  end
end
