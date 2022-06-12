require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  it "exists" do
    expect(@enigma = Enigma.new).to be_instance_of(Enigma)
  end

  it "can encrypt a message with a key and date" do
      encrypt_key =
    {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
    }

    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohuwl", key: "02715", date: "040895"})
  end

  #   xit "can decrypt a message with a key and date" do
  #     decrypt_key =
  #   {
  #   decryption: "hello world",
  #   key: "02715",
  #   date: "040895"
  #   }
  #
  #   expect(@enigma.decrypt_key).to eq("hello world", "02715", "040895")
  # end

  # it "can encrypt a message with a key with today's date" do
  #   encrypted = enigma.encrypt("hello world", "02715")
  #
  # end
  #
  # xit "can decrypt a message with a key with today's date" do
  #   @enigma.decrypt(encrypted[:encryption], "02715")
  #
  # end
  #
  # xit "can encrpyt a message with a random key and today's date" do
  #   @enigma.encrypt("hello world")
  # end
end
