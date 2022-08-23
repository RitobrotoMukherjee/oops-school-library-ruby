require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
    def correct_name
        name = @nameable.correct_name
        if name.length > 10
            name.slice!(10, name.length)
        end
        name
    end
end