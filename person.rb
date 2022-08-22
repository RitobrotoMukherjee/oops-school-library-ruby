class Person
  attr_reader :id

  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...99_999)
    @name = name
    @age = age
    @permission = parent_permission
  end

  def can_use_services?
    return true if @permission || of_age?

    false
  end

  private

  def of_age?
    @age >= 18
  end
end
