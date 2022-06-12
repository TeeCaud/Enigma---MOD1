require 'enigma'

RSpec.describe Encryption do
  before :each do
    @encryption = Encryption.new("hello world", "02715", "040895")
  end

  it "exists with attributes" do

    expect(@encryption).to be_instance_of(Encryption)
  end
end
