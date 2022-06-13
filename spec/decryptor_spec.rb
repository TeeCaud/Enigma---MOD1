require './lib/decryptor'

RSpec.describe Decryptor do
  before :each do
    @decrypt = Decryptor.new("keder ohulw", "02715", "040895")
  end

  it "exists with attributes" do
    expect(@decrypt).to be_instance_of(Decryptor)
    expect(@decrypt.message).to eq("keder ohulw")
    expect(@decrypt.key).to eq("02715")
    expect(@decrypt.date).to eq("040895")
  end

  it "has a character set array by default" do
    expect(@decrypt.character_set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end
end
