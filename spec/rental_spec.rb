require 'date'
require_relative '../models/rental'

# Arrange
class FakePerson
  attr_reader :rentals

  def initialize(_rentals)
    @rentals = []
  end
end

class FakeBook
  attr_reader :rentals

  def initialize(_rentals)
    @rentals = []
  end
end

describe Rental do
  # ACT
  before :each do
    @person = FakePerson.new []
    @book = FakeBook.new []

    @rental = Rental.new '02-02-2022', @person, @book
  end

  # Assert
  it 'date should be 02-02-2022' do
    expect(@rental.date).to eq '02-02-2022'
  end

  it 'person should be instance of mocked person' do
    expect(@rental.person).to be_instance_of FakePerson
  end

  it 'book should be instance of mocked book' do
    expect(@rental.book).to be_instance_of FakeBook
  end
end
