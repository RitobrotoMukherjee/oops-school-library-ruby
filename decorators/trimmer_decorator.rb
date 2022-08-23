require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    name = @nameable.correct_name
    name.slice!(10, name.length) if name.length > 10
    name
  end
end
