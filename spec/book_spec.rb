require_relative '../models/book'

describe Book do
  before :each do
    @book = Book.new 'Test Book', 'Test Author'
  end

  it '@id should be integer' do
    expect(@book.id).to be_instance_of Integer
  end

  it '@title should be Test Book' do
    expect(@book.title).to eq 'Test Book'
  end

  it '@author should be Test Author' do
    expect(@book.author).to eq 'Test Author'
  end

  it '@rentals should be empty' do
    expect(@book.rentals.count).to eq 0
  end

  describe '#add_rental' do
    it 'rentals to be 1 and the instance value to be true' do
      stub = double('rental')
      allow(stub).to receive(:new).and_return(true)

      fake_rental = stub.new

      @book.add_rental(fake_rental)

      expect(@book.rentals.count).to eq 1
      expect(@book.rentals).to eq [true]
    end
  end
end
