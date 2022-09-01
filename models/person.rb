require_relative '../interfaces/nameable'

class Person < Nameable
  attr_reader :id, :rentals, :permission

  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1...99_999)
    @name = name
    @age = age
    @permission = parent_permission
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def can_use_services?
    @permission || of_age?
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
