require "../lib/renter"

RSpec.describe Renter do
  before :each do
    @patrick = Renter.new("Patrick Star", "4242424242424242")
  end

  it "is Patrick" do
    expect(@patrick.name).to eq("Patrick Star")
  end

  it "has cc" do
    expect(@patrick.cc_num).to eq("4242424242424242")
  end

end
