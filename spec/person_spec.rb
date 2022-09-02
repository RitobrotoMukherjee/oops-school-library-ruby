require_relative '../models/person'

describe Person do
  # Arrange
  before :each do
    @person = Person.new 25, 'Rito', parent_permission: true
  end

  # Assert
  describe '#new' do
    it 'takes three parameters and reteurns instance of Person' do
      expect(@person).to be_instance_of Person
    end
  end

  it 'name should be Rito' do
    expect(@person.name).to eq 'Rito'
  end

  it 'age should be 25' do
    expect(@person.age).to eq 25
  end

  it 'parent_permission should be true' do
    expect(@person.permission).to eq true
  end

  it 'rentals in the begining should be empty' do
    expect(@person.rentals.count).to eq 0
  end

  describe '#add_rental' do
    it 'rentals should be 1' do
      # Act
      @person.add_rental('test')
      # Assert
      expect(@person.rentals.count).to eq 1
    end
  end

  describe '#correct_name' do
    it 'name should be Mukherjee' do
      # ACT
      @person.name = 'Mukherjee'
      # Assert
      expect(@person.correct_name).to eq 'Mukherjee'
    end
  end
end
