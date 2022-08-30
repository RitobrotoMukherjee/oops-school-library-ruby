require_relative '../interfaces/base'

class BaseController < Base
  attr_reader :iostream

  # iostream can be JSON/MySQL/Postgres etc
  def initialize(iostream)
    super()
    @iostream = iostream
  end

  def list(_data = [])
    puts "\nData is empty"
  end

  def create(_app, _inst)
    puts "\nNothing to create"
  end
end
