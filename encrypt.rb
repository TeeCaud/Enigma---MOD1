require './lib/enigma'
require './lib/encryptor'
require 'pry'


file = File.open(ARGV[0], "r")
text = file.read
file.close
results = Enigma.new.encrypt(text)
encrypted = File.open(ARGV[1], "w")

encrypted.write(results[:encryption])
puts "Created 'encrypted_message.txt' with the key #{results[:key]} and date #{results[:date]}."

encrypted.close
