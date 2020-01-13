require_relative "./enigma"

ARGV == ["message.txt", "encrypted.txt"]
ARGV[0] == "message.txt"
ARGV[1] == "encrypted.txt"

file = File.open(ARGV[0], "r")
message = file.read

enigma = Enigma.new
output = enigma.encrypt(message)

encrypted_file = File.open(ARGV[1], "w")
encrypted_file.write(output[:encryption])
encrypted_file.close

puts "Created #{ARGV[1]} with the key #{output[:key]} and date #{output[:date]}"
