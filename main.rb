# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity

require_relative 'app'

def main()
  app = App.new
  input = nil

  while input != 7
    app.main_options
    input = app.take_input

    case input

    when 1
      puts "\n#{app.list_books}"

    when 2
      puts "\n#{app.list_people}"

    when 3
      option = app.person_get_option
      app.create_person(option) unless option.is_a? String
      puts option if option.is_a? String
    when 4
      app.create_book
    when 5
      app.create_rental

    else
      puts input unless input == 7
    end
  end

  return puts "\nGoodBye" if input == 7
end

main

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
