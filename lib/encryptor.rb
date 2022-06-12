class Encryptor

  attr_reader :message, :key, :date, :character_set
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @character_set = ("a".."z").to_a <<  " "

  end
end
