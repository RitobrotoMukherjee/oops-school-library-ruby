module CreateIOFiles
  def check_file(file, file_path)
    File.exist?("#{file_path}/#{file}")
  end

  def read_file(file, file_path)
    File.read("#{file_path}/#{file}")
  end

  def write_file(file, file_path, data)
    File.write("#{file_path}/#{file}", data) unless data.empty?
  end
end
