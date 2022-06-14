require './lib/encryptor'

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

  it "can generate keys" do
    expect(@encrypt.generate_keys).to eq({:a_key=>2, :b_key=>27, :c_key=>71, :d_key=>15})
  end

  it "has an offset generator" do
    expect(@encrypt.offsets).to be_a(Hash)
  end

  it "can generate offsets" do
    expect(@encrypt.generate_offsets).to eq({:a_offset=>1, :b_offset=>0, :c_offset=>2, :d_offset=>5})
  end

  it "has a shift" do
    expect(@encrypt.shifts).to eq({})
  end

  it "has a shift generator" do
    @encrypt.generate_keys
    @encrypt.generate_offsets
    expect(@encrypt.generate_shifts).to eq({:a_shift=>3, :b_shift=>27, :c_shift=>73, :d_shift=>20})
  end

  it "creates a hash with the encrypted message" do
    expect(@encrypt.encrypt).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end

  it "will return a special character" do
    encrypt = Encryptor.new("hello world!", "02715", "040895")

    expect(encrypt.encrypt).to eq({
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
        })
  end
end
