require './lib/generators'
require './lib/enigma'

class Encryptor
  include Generators

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

  def encrypt
    key_generator if @key == nil
    generate_date if @date == nil
    # require 'pry'; binding.pry
    generate_keys
    generate_offsets
    generate_shifts
    index = 0
    encryption_message = @message.chars.map do |char|
      if !character_set.include?(char)
        char
      else
        if char.ord == 32
          char = "{"
        end
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
