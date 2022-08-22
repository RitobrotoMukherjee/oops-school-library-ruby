require_relative 'person'

person1 = Person.new(10, 'Test', parent_permission: true)

person2 = Person.new(27, 'Rito', parent_permission: true)

puts person2.id
puts person2.name
puts person2.age
puts person2.can_use_services?

puts "\nPerson 1 details"
puts person1.id
puts person1.name
puts person1.age
person1.name = 'Check'
puts person1.name
puts person1.can_use_services?
