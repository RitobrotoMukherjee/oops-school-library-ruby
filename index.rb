require './classes/person'
require './classes/student'
require './classes/teacher'
require './classes/classroom'
require './decorators/capitalize_decorator'
require './decorators/trimmer_decorator'

puts "\nRelationships:"

rito = Student.new('Class 1', 18, 'Rito')
queen = Student.new('Class 1', 21, 'Queen')
sayantani = Student.new('Class 2', 22, 'Sayantani')

class1 = Classroom.new('Class 1')
class2 = Classroom.new('Class 2')

puts "\n#{class1.label} details:"
puts "\n\n#{class1.label} students count: #{class1.students.count}"
class1.add_student(rito)
class1.add_student(queen)
puts "\nAfter #{rito.name} and #{queen.name} adding Students - count: #{class1.students.count}"
puts "\nRito is in class: #{rito.classroom.label}"
puts "\n#{class1.label} last student added is: #{class1.students.last.name}"
puts "\n#{class1.students.last.name} age is: #{class1.students.last.age}"
puts "\nList of students in #{class1.label}"
student_list = class1.students.map { |student| student.name }
p student_list


puts "\n\n#{class2.label} students count: #{class2.students.count}"
class2.add_student(sayantani)
puts "\nAfter adding #{sayantani.name} Students - count: #{class2.students.count}"
puts "\n#{sayantani.name} is in - #{sayantani.classroom.label}"
puts "\nList of students in #{class2.label}"
student_list = class2.students.map { |student| student.name }
p student_list

# puts "\n\nDecorators:"
# person = Person.new(22, 'maximilianus')
# puts person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name

# person1 = Person.new(10, 'Test', parent_permission: false)

# person2 = Person.new(27, 'Rito', parent_permission: true)

# student = Student.new(1, 15, 'Mukherjee', parent_permission: true)

# teacher = Teacher.new('English', 35, 'Mr. Robot', parent_permission: true)

# puts "\n\nPerson 1 details:\n"
# puts person1.id
# puts person1.name
# puts person1.age
# person1.name = 'Check'
# puts person1.name
# puts person1.can_use_services?

# puts "\nPerson 2 details:\n"
# puts person2.id
# puts person2.name
# puts person2.age
# puts person2.can_use_services?

# puts "\nStudents details:\n"
# puts student.id
# puts student.name
# puts student.classroom
# puts student.play_hooky
# puts student.can_use_services?

# puts "\nTechers details:\n"
# puts teacher.id
# puts teacher.name
# puts teacher.age
# puts teacher.specialization
# puts teacher.can_use_services?
