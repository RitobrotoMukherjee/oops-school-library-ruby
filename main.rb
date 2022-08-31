# rubocop:disable Metrics/CyclomaticComplexity
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
      puts "\n#{Bootstrap::BOOK_CONTROLLER.print}"

    when 2
      puts "\n#{Bootstrap::PERSON_CONTROLLER.print}"

    when 3
      app.person_get_option
      option = app.take_input(Bootstrap::PEOPLE_MENU_RANGE, 'Cannot create person')
      app.create_person(option) unless option.is_a? String
      puts option if option.is_a? String
    when 4
      app.create_book
    # when 5
    #   app.create_rental if app.rentable?

    # when 6
    #   RENTAL_CONTROLLER.list
    else
      puts input unless input == 7
    end
  end

  return puts "\nGoodBye" if input == 7
end

app = App.new

main app

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
