require_relative 'app'

def main()
  app = App.new
  input = nil

  while input != 7
    app.options
    input = app.get_input

    case input
    
    when 1
        puts "\n#{app.list_books}"

    when 2
        puts "\n#{app.list_people}"
    else
        puts input
    end
  end

  return puts "\nGoodBye" if input == 7
end

main
