require_relative './enigma'
require_relative './valid_input'

ARGV == ['message.txt', 'encrypted.txt']
ARGV[0] == 'message.txt'
ARGV[1] == 'encrypted.txt'

valid_input = ValidInput.new(ARGV[0], ARGV[1])
enigma = Enigma.new

message = valid_input.check_valid_file

if message == 0
  puts "\nThe file you are trying to load is not in the current directory \n \nDid you mean? \n"
  Dir["./*.txt"].each { |file| puts '  -' + file[2..-1] }
  exit
end

output_file = valid_input.check_valid_output_file_name

if output_file == 0
  puts "The file name you entered is not valid. Please enter a file name ending with '.txt'"
  exit
end

output = enigma.encrypt(message)

encrypted = File.open(output_file, 'w')
encrypted.write(output[:encryption])
encrypted.close

puts "Created #{output_file} with the key #{output[:key]} and date #{output[:date]}"
