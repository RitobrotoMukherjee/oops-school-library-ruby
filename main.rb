# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

require_relative 'app'

def main(app)
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
      app.create_rental if app.rentable?

    when 6
      person_id = app.take_person_id
      app.print_rentals(person_id) if person_id.is_a? Integer
    else
      puts input unless input == 7
    end
  end

  return puts "\nGoodBye" if input == 7
end

app = App.new

main app

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
