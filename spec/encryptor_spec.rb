require './lib/encryptor'
require './lib/enigma'

RSpec.describe Encryptor do
  before :each do
    @encrypt= Encryptor.new("hello world", "02715", "040895")
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
end
