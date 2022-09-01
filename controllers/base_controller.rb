require_relative '../interfaces/base'

class BaseController < Base
  attr_reader :iostream, :file

  # iostream can be JSON/MySQL/Postgres etc
  def initialize(iostream, file_name)
    super()
    @iostream = iostream
    @file_name = file_name
  end

  def print
    puts "\nCannot Print Data"
  end

  def list
    puts "\nData list is empty"
  end

  def save
    puts "\nCannot save to #{@file_name}"
  end
end
