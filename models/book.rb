class Book
  attr_reader :rentals
  attr_accessor :title, :author, :id

  def initialize(title, author)
    @id = Random.rand(1...99_999)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end
end
