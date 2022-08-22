require_relative 'person'
require_relative 'student'

person1 = Person.new(10, 'Test', parent_permission: true)

person2 = Person.new(27, 'Rito', parent_permission: true)

student = Student.new(1, 25, 'Mukherjee', parent_permission: true)

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
puts student.can_use_services?
puts student.classroom
puts student.play_hooky
