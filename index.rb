require './person'
require './student'
require './teacher'

person1 = Person.new(10, 'Test', parent_permission: false)

person2 = Person.new(27, 'Rito', parent_permission: true)

student = Student.new(1, 15, 'Mukherjee', parent_permission: true)

teacher = Teacher.new('English', 35, 'Mr. Robot', parent_permission: true)

puts "\nPerson 1 details:\n"
puts person1.id
puts person1.name
puts person1.age
person1.name = 'Check'
puts person1.name
puts person1.can_use_services?

puts "\nPerson 2 details:\n"
puts person2.id
puts person2.name
puts person2.age
puts person2.can_use_services?

puts "\nStudents details:\n"
puts student.id
puts student.name
puts student.classroom
puts student.play_hooky
puts student.can_use_services?

puts "\nTechers details:\n"
puts teacher.id
puts teacher.name
puts teacher.age
puts teacher.specialization
puts teacher.can_use_services?
