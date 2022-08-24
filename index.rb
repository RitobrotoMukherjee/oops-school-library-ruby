require './classes/person'
require './classes/book'
require './classes/rental'
require './classes/student'
require './classes/teacher'
require './classes/classroom'
require './decorators/capitalize_decorator'
require './decorators/trimmer_decorator'

puts "\nRelationships Students & Classroom:"

rito = Student.new('Class 1', 18, 'Rito')
queen = Student.new('Class 1', 21, 'Queen')
sayantani = Student.new('Class 2', 22, 'Sayantani')

class1 = Classroom.new('Class 1')
class2 = Classroom.new('Class 2')

puts "\n\n#{class1.label} details:"
puts "\nInitial #{class1.label} students count: #{class1.students.count}"
class1.add_student(rito)
class1.add_student(queen)
puts "\nAfter #{rito.name} and #{queen.name} adding Students - count: #{class1.students.count}"
puts "\nRito is in class: #{rito.classroom.label}"
puts "\n#{class1.label} last student added is: #{class1.students.last.name}"
puts "\n#{class1.students.last.name} age is: #{class1.students.last.age}"
puts "\nList of students in #{class1.label}"
student_list = class1.students.map(&:name)
p student_list

puts "\n\n#{class2.label} details:"
puts "\nInitial #{class2.label} students count: #{class2.students.count}"
class2.add_student(sayantani)
puts "\nAfter adding #{sayantani.name} Students - count: #{class2.students.count}"
puts "\n#{sayantani.name} is in - #{sayantani.classroom.label}"
puts "\nList of students in #{class2.label}"
student_list = class2.students.map(&:name)
p student_list

puts "\n\nRelationships Person, Book & Rentals:"
person1 = Person.new(18, 'Ritobroto', parent_permission: false)
person2 = Person.new(27, 'Queeen', parent_permission: true)

book1 = Book.new('Nuclear Family', 'Joseph Han')
book2 = Book.new('The Angel of Rome', 'Jess Walter')

puts "\nInitital Total rentals of #{book1.title} = #{book1.rentals.count}"
puts "\nInitital Total rentals of #{book2.title} = #{book2.rentals.count}"
Rental.new('24-08-2022', person1, book1)
Rental.new('21-07-2022', person2, book1)
Rental.new('21-07-2022', person1, book2)

puts "\n#{person1.name} has rented total books = #{person1.rentals.count}"
puts "\n#{person2.name} has rented total books = #{person2.rentals.count}"

puts "\n#{person1.name} rented book list:"
rental_details = ''
person1.rentals.each_with_index do |rental, i|
  rental_details += "\n#{i + 1} => #{rental.full_date}: #{rental.book.title} by #{rental.book.author}"
end
puts rental_details

rental_details = ''
puts "\n#{person2.name} rented book list:"
person2.rentals.each_with_index do |rental, i|
  rental_details += "\n#{i + 1} => #{rental.full_date}: #{rental.book.title} by #{rental.book.author}"
end
puts rental_details

puts "\nFinally Total rentals of #{book1.title} = #{book1.rentals.count}"
puts "\nFinally Total rentals of #{book2.title} = #{book2.rentals.count}"

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
