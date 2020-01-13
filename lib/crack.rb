require_relative './enigma'

ARGV == ['ecnrypted.txt', 'cracked.txt', 'date']
ARGV[0] == 'encrypted.txt'
ARGV[1] == 'cracked.txt'
ARGV[2] == 'date'

encrypted = File.open(ARGV[0], 'r')
message = encrypted.read

enigma = Enigma.new
output = enigma.crack(message, ARGV[2])

cracked = File.open(ARGV[1], 'w')
cracked.write(output[:decryption])
cracked.close

puts "Created #{ARGV[1]} with the cracked key #{output[:key]} and date #{output[:date]}"
