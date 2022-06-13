require './lib/decryptor'

RSpec.describe Decryptor do
  before :each do
    @decrypt = Decryptor.new("keder ohulw", "02715", "040895")
  end

  it "exists with attributes" do
    expect(@decrypt).to be_instance_of(Decryptor)
  end
end
