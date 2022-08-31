require_relative 'base_controller'
require_relative '../models/teacher'

class PersonController < BaseController
  def print(indexed: false)
    people = @iostream.read(@file_name)
    return 'No person had been added to the library' unless people.any?

    text = ''

    people.each.with_index(1) do |person, i|
      data = "[#{person['type']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"

      text += "\n#{i}) #{data}" if indexed
      text += "\n#{data}" unless indexed
    end

    text
  end

  def create(person, message = '')
    people = @iostream.read(@file_name)
    obj = { id: person.id, name: person.name, age: person.age, type: 'Student' }

    if person.is_a?(Teacher)
      obj['type'] = 'Teacher'
      obj['specialization'] = person.specialization
    else
      obj['permission'] = person.permission
    end

    people << obj
    @iostream.write(@file_name, people)
    puts message
  end

  def list
    data_list = @iostream.read(@file_name)
    return 'No person added to the library' unless data_list.any?

    data_list
  end
end
