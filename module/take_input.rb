module TakeInput
  def take_input(range, text = '')
    input = gets.chomp
    return "\n'#{input}' is not a valid input.#{text}.\nPlease try again" unless range.include?(input.to_i)

    input.to_i
  end

  def take_input_with_label(label)
    print "#{label}: "
    gets.chomp
  end
end
