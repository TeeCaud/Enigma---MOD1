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

  it "has a date of transmission" do
    expect(@decrypt.date_of_transmission).to eq(1672401025)
  end

  it "has a hash of keys" do
    expect(@decrypt.keys).to be_a(Hash)
  end

  it "has a random key generator" do
    expect(@decrypt.key_generator.length).to eq 5
  end

  it "can generate keys" do
    expect(@decrypt.generate_keys).to eq({:a_key=>2, :b_key=>27, :c_key=>71, :d_key=>15})
  end

  it "has an offset generator" do
    expect(@decrypt.offsets).to be_a(Hash)
  end

  it "can generate offsets" do
    expect(@decrypt.generate_offsets).to eq({:a_offset=>1, :b_offset=>0, :c_offset=>2, :d_offset=>5})
  end

  it "has a shift" do
    expect(@decrypt.shifts).to eq({})
  end

  it "has a shift generator" do
    @decrypt.generate_keys
    @decrypt.generate_offsets
    expect(@decrypt.generate_shifts).to eq({:a_shift=>3, :b_shift=>27, :c_shift=>73, :d_shift=>20})
  end

  it "creates a hash with the decrypted message" do
    @decrypt.generate_keys
    @decrypt.generate_offsets
    @decrypt.generate_shifts
    @decrypt.decrypt

    expect(@decrypt.decrypt).to eq({
        decryption: "hello world",
        key: "02715",
        date: "040895"
      })
  end
end
