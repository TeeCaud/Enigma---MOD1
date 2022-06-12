require 'pry'
class Enigma

  def initialize
  end

  def encrypt(message, key, date)
    # {:encryption => message,
    # :key => key,
    # :date => date}

    character_set = ("a".."z").to_a <<  " "
    random_nums = 5.times.map { rand(5) }
    a_key = random_nums[0..1]
    b_shift = random_nums[1..2]
    c_shift = random_nums[2..3]
    d_shift = random_nums[3..4]

    date_of_transmission = "040895".to_i ** 2

    a_offset = date_of_transmission.to_s[-4..-1][0]
    b_offset = date_of_transmission.to_s[-4..-1][1]
    c_offset = date_of_transmission.to_s[-4..-1][2]
    d_offset = date_of_transmission.to_s[-4..-1][3]
    binding.pry
  end
end
