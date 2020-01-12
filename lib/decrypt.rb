require_relative "./enigma"

ARGV == ["encrypted.txt", "decrypted.txt", "key", "date"]
ARGV[0] == "encrypted.txt"
ARGV[1] == "decrypted.txt"
ARGV[2] == "key"
ARGV[3] == "date"

enigma = Enigma.new

file = File.open(ARGV[0], "r")
message = file.read

output = enigma.decrypt(message, ARGV[2], ARGV[3])

decrypted_file = File.open(ARGV[1], "w")
decrypted_file.write(output[:decryption])
decrypted_file.close

puts "Created #{ARGV[1]} with the key #{output[:key]} and date #{output[:date]}"
