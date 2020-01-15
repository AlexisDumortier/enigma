require_relative './enigma'
require_relative './valid_input'

ARGV == ['ecnrypted.txt', 'cracked.txt', 'date']
ARGV[0] == 'encrypted.txt'
ARGV[1] == 'cracked.txt'
ARGV[2] == 'date'

valid_input = ValidInput.new(ARGV[0], ARGV[1], ARGV[2])
enigma = Enigma.new

encrypted_message = valid_input.check_valid_file

if encrypted_message == 0
  puts "\nThe file you are trying to load is not in the current directory \n \nDid you mean? \n"
  Dir["./*.txt"].each { |file| puts '  -' + file[2..-1] }
  exit
end


output_file = valid_input.check_valid_output_file_name

if output_file == 0
  puts "The file name you entered is not valid. Please enter a file name ending with '.txt'"
  exit
end

date = valid_input.check_valid_date

if date == 0
  puts 'The date you entered is not valid. Please enter a valid date (ddmmyy)'
  exit
end

output = enigma.crack(encrypted_message, date)

cracked = File.open(output_file, 'w')
cracked.write(output[:decryption])
cracked.close

puts "Created #{output_file} with the cracked key #{output[:key]} and date #{output[:date]}"
