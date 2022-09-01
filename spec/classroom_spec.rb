require_relative '../models/classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Class'
  end

  it '@label should be Class' do
    expect(@classroom.label).to eq 'Class'
  end

  it '@students should be empty' do
    expect(@classroom.students.count).to eq 0
  end

  describe '#add_student' do
    it '@students to be 1 and the students must have a student array' do
      student = double('student')
      allow(student).to receive(:classroom=).with(@classroom).and_return(true)
      @classroom.add_student(student)

      expect(@classroom.students.count).to eq 1
      expect(@classroom.students).to eq [student]
    end
  end
end
