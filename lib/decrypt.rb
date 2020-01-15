require_relative "./enigma"
require_relative "./valid_input"

ARGV == ["encrypted.txt", "decrypted.txt", "key", "date"]
ARGV[0] == "encrypted.txt"
ARGV[1] == "decrypted.txt"
ARGV[2] == "key"
ARGV[3] == "date"

valid_input = ValidInput.new(ARGV[0], ARGV[1],ARGV[3], ARGV[2])

encrypted_message = valid_input.check_valid_file

if encrypted_message == 0
  puts "\nThe file you are trying to load is not in the current directory \n \nDid you mean? \n"
  Dir["./*.txt"].each { |file| puts '  -' + file[2..-1] }
  exit
end

date = valid_input.check_valid_date

if date == 0
  puts 'The date you entered is not valid. Please enter a valid date (ddmmyy)'
  exit
end

output_file = valid_input.check_valid_output_file_name

key = valid_input.check_valid_key

if key == 0 
  puts "The key you entered is not valid. Please enter a 5-digit key"
  exit
end

enigma = Enigma.new
output = enigma.decrypt(encrypted_message, key, date)

decrypted_file = File.open(output_file, "w")
decrypted_file.write(output[:decryption])
decrypted_file.close

puts "Created #{output_file} with the key #{output[:key]} and date #{output[:date]}"
