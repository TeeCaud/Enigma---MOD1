require './lib/encryptor'

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
end
