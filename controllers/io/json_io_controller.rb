require 'json'
require_relative '../../module/create_io_files'

class JsonIOController
  include CreateIOFiles

  def read(file)
    data = []
    data = JSON.parse(read_file(file, 'data')) if check_file(file, 'data') && read_file(file, 'data') != ''
    data
  end

  def write(file, data)
    write_file(file, 'data', JSON.generate(data))
    puts "\nSuccessfully written to #{file}"
  end
end
