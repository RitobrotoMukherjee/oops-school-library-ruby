require_relative 'base_controller'
require_relative '../classes/person'
require_relative '../classes/student'

class PersonController < BaseController
  def list(people, indexed: false)
    return 'No person had been added to the library' unless people.any?

    text = ''

    people.each.with_index(1) do |person, i|
      type = person.instance_of?(Student) ? 'Student' : 'Teacher'
      data = "[#{type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"

      text += "\n#{i}) #{data}" if indexed
      text += "\n#{data}" unless indexed
    end

    text
  end

  def create(app, person, message = '')
    app.people << person
    puts message
  end
end
