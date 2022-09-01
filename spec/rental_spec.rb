require 'date'
require_relative '../models/rental'

describe Classroom do
  before :each do
    @rental = Rental.new '02-02-2022'
  end
end
