require 'pry'
class Encryptor

  attr_reader :message,
   :key,
   :date,
   :character_set,
   :keys,
   :offsets,
   :shifts

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @character_set = ("a".."z").to_a <<  " "
    @date_of_transmission = @date.to_i ** 2
    @keys = Hash.new(0)
    @offsets = Hash.new(0)
    @shifts = Hash.new(0)
  end

  def date_of_transmission
    @date.to_i ** 2
  end

  def key_generator
    @key = 5.times.map { rand(10) }.join
  end

  def generate_keys
    @keys[:a_key] = @key[0..1].to_i
    @keys[:b_key] = @key[1..2].to_i
    @keys[:c_key] = @key[2..3].to_i
    @keys[:d_key] = @key[3..4].to_i
    @keys
  end

  def generate_offsets
    offset = (@date.to_i ** 2).to_s[-4..-1]
    @offsets[:a_offset] = offset[0].to_i
    @offsets[:b_offset] = offset[1].to_i
    @offsets[:c_offset] = offset[2].to_i
    @offsets[:d_offset] = offset[3].to_i
    @offsets
  end

  def shift_generator
    @shifts[:a_shift] = @keys[:a_key] + @offsets[:a_offset]
    @shifts[:b_shift] = @keys[:b_key] + @offsets[:b_offset]
    @shifts[:c_shift] = @keys[:c_key] + @offsets[:c_offset]
    @shifts[:d_shift] = @keys[:d_key] + @offsets[:d_offset]
    @shifts
  end


    def encrypt
  end
end
