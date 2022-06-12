require 'pry'
class Encryptor

  attr_reader :message,
   :key,
   :date,
   :character_set,
   :date_of_transmission,
   :keys

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @character_set = ("a".."z").to_a <<  " "
    @date_of_transmission = @date.to_i ** 2
    @keys = Hash.new
  end

  def key_generator
    @key = 5.times.map { rand(10) }.join
  end

  def generate_keys
    @keys[:a_key] = @key[0..1].to_i
    @kyes[:b_key] = @key[1..2].to_i
    @keys[:c_key] = @key[2..3].to_i
    @keys[:d_key] = @key[3..4].to_i
  end

    def encrypt
  end
end
