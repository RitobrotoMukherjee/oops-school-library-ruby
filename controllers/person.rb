require_relative 'base_controller'
require_relative '../models/teacher'
require_relative '../models/student'

class PersonController < BaseController
  def print(people, indexed: false)
    return 'No person had been added to the library' unless people.any?

    text = ''

    people.each.with_index(1) do |person, i|
      type = person.is_a?(Teacher) ? 'Teacher' : 'Student'
      data = "[#{type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"

      text += "\n#{i}) #{data}" if indexed
      text += "\n#{data}" unless indexed
    end

    text
  end

  def list
    @iostream.read(@file_name).map do |person|
      obj = if person['type'] == 'student'
              Student.new(person['age'], person['name'], person['permission'])
            else
              Teacher.new(person['specialization'], person['age'], person['name'])
            end
      obj.id = person['id']
      obj
    end
  end

  def save(people)
    save_obj = people.map do |person|
      obj = { id: person.id, name: person.name, age: person.age, type: 'student' }
      if person.is_a?(Teacher)
        obj[:type] = 'teacher'
        obj[:specialization] = person.specialization
      else
        obj[:permission] = person.permission
      end
      obj
    end
    @iostream.write(@file_name, save_obj)
  end
end
