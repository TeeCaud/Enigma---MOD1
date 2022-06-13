require './lib/enigma'
require './lib/encryptor'
require './lib/decryptor'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  it "exists" do
    expect(@enigma = Enigma.new).to be_instance_of(Enigma)
    end

    it "can generate a random key" do
      @enigma.key_generator
      expect(@enigma.key_generator.length).to eq(5)
    end

    it "can generate today's date" do
      expect(@enigma.generate_date.length).to eq(6)
    end

    it "can encrypt a message" do
      expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
    end

    it "can decrypt a message" do
        expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
    end
  end
