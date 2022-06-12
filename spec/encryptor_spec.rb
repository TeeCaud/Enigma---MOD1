require './lib/encryptor'
require './lib/enigma'

RSpec.describe Encryptor do
  before :each do
    @encrypt = Encryptor.new("hello world", "02715", "040895")
  end

  it "exists with attributes" do
    expect(@encrypt).to be_instance_of(Encryptor)
    expect(@encrypt.message).to eq("hello world")
    expect(@encrypt.key).to eq("02715")
    expect(@encrypt.date).to eq("040895")
  end

  it "has a character set array by default" do
    expect(@encrypt.character_set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it "has a date of transmission" do
    expect(@encrypt.date_of_transmission).to eq(1672401025)
  end

  it "has a hash of keys" do
    expect(@encrypt.keys).to be_a(Hash)
  end

  it "has a random key generator" do
    expect(@encrypt.key_generator.length).to eq 5
  end
end
