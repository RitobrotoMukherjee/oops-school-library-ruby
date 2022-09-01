require_relative '../models/teacher'

describe Teacher do
  # Arrange
  before :each do
    @teacher = Teacher.new 'CS', 45
  end

  describe '#new' do
    it 'should be instance of Teacher' do
      expect(@teacher).to be_instance_of Teacher
    end
  end

  it 'ID should be Integer' do
    expect(@teacher.id).to be_instance_of Integer
  end

  it 'specialization should be CS' do
    expect(@teacher.specialization).to eq 'CS'
  end

  it 'permission should be true' do
    expect(@teacher.permission).to eq true
  end

  describe '#can_use_services?' do
    it 'should return true' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
