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

  def generate_shifts
    @shifts[:a_shift] = @keys[:a_key] + @offsets[:a_offset]
    @shifts[:b_shift] = @keys[:b_key] + @offsets[:b_offset]
    @shifts[:c_shift] = @keys[:c_key] + @offsets[:c_offset]
    @shifts[:d_shift] = @keys[:d_key] + @offsets[:d_offset]
    @shifts
  end

  def encrypt
    generate_keys
    generate_offsets
    generate_shifts
    index = 0
    encryption_message = @message.chars.map do |char|
      # binding.pry
      if ([(32..96).to_a, (123..126).to_a].flatten).include?(char.ord)
     index += 1
        char
      else
        if index == 0
          index += 1
          @character_set.rotate(char.ord - 97 + @shifts[:a_shift])[0]
        elsif index == 1
          index += 1
          @character_set.rotate(char.ord - 97 + @shifts[:b_shift])[0]
        elsif
          index == 2
          index += 1
          @character_set.rotate(char.ord - 97 + @shifts[:c_shift])[0]
        elsif
          index == 3
          index = 0
          @character_set.rotate(char.ord - 97 + @shifts[:d_shift])[0]
        end
      end
    end.join
    encrypt_instance = Hash.new(0)
    encrypt_instance[:encryption] = encryption_message
    encrypt_instance[:key] = @key
    encrypt_instance[:date] = @date
    encrypt_instance
  end
end
