require './lib/enigma'
require './lib/decryptor'

file = File.open(ARGV[0], "r")
text = file.read
key = ARGV[2]
date = ARGV[3]
file.close
results = Enigma.new.decrypt(text, key, date)
decrypted = File.open(ARGV[1], "w")

decrypted.write(results[:decryption])
puts "Created 'decrypted_message.txt' with the key #{results[:key]} and date #{results[:date]}."

decrypted.close
