# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/MethodLength

require_relative 'app'
puts 'Welcome to School Library CLI App by Ritobroto Mukherjee'
def main(app)
  input = nil

  while input != 7
    app.main_options
    input = app.take_input(Bootstrap::MAIN_MENU_RANGE)
    case input

    when 1
      puts "\n#{Bootstrap::BOOK_CONTROLLER.print(app.books)}"

    when 2
      puts "\n#{Bootstrap::PERSON_CONTROLLER.print(app.people)}"

    when 3
      app.person_get_option
      option = app.take_input(Bootstrap::PEOPLE_MENU_RANGE, 'Cannot create person')
      app.create_person(option) unless option.is_a? String
      puts option if option.is_a? String
    when 4
      app.create_book
    when 5
      app.create_rental if Bootstrap::RENTAL_CONTROLLER.rentable?(app.people, app.books)
    when 6
      app.print_rentals
    else
      puts input unless input == 7
    end
  end
  return unless input == 7

  app.save_data
  puts "\nGoodBye"
end

app = App.new

main app

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/MethodLength
