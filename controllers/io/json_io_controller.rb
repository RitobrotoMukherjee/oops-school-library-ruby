require_relative '../../interfaces/io'
require_relative '../../module/create_io_files'

class JsonIOController < IO
  include CreateIOFiles

  def initialize(*files)
    super()
    files.each { |file| CreateIOFiles.create_json_file(file) }
  end

  def read(_file)
    []
  end

  def write(file, _data)
    puts "\nSuccessfully written to #{file}.json"
  end
end
