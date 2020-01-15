require 'date'

class ValidInput

  def initialize(input_file_name, output_file_name, date='', key='') 
    @input_file_name = input_file_name
    @output_file_name = output_file_name
    @date = date
    @key = key
  end 
  

  def check_valid_file
    if Dir["./*.txt"].include? ('./' + @input_file_name)
      file = File.open(@input_file_name, "r")
      file.read
    else
      0
    end
  end

  def check_valid_date
    if ((Date.strptime(@date, '%d%m%y') rescue nil).nil?) || (@date.length != 6)
      0
    else
      @date
    end
  end

  def check_valid_output_file_name
    @output_file_name[-4..-1] == '.txt' ? @output_file_name : 0
  end

  def check_valid_key
    @key.length == 5 && (@key == '00000' || @key.to_i != 0) ? @key : 0
  end

end