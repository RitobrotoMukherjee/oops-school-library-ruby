require_relative '../models/student'

describe Student do
  # Arrange
  before :each do
    @student = Student.new 30, 'Rito', false
  end

  describe '#new' do
    it 'should be instance of Student' do
      expect(@student).to be_instance_of Student
    end
  end

  it 'ID should be Integer' do
    expect(@student.id).to be_instance_of Integer
  end

  it 'age should be 30' do
    expect(@student.age).to eq 30
  end

  it 'permission should be false' do
    expect(@student.permission).to eq false
  end

  it 'classroom should be nil' do
    expect(@student.classroom).to be_nil
  end

  describe '#play_hooky' do
    it 'to return pattern' do
      expect(@student.play_hooky).to eq "¯\(ツ)/¯"
    end
  end
end
