require './lib/encryptor'
require './lib/decryptor'
class Enigma

  def initialize
  end

  def key_generator
    key = 5.times.map { rand(10) }.join
  end

  def generate_date
    Time.now.strftime("%e%m%y")
  end

  def encrypt(message, key=key_generator, date=generate_date)
    Encryptor.new(message, key, date).encrypt
  end

  def decrypt(message, key, date=generation_date)
    Decryptor.new(message, key, date).decrypt
  end
end
