require_relative 'app'

puts 'Welcome to School Library CLI App by Ritobroto Mukherjee'

def main(app)
  input = nil

  while input != 7
    app.main_options
    input = app.take_input(Bootstrap::MAIN_MENU_RANGE)
    app.perform_main_operation(input)
  end

  app.save_data
  puts "\nGoodBye"
end

app = App.new

main app
