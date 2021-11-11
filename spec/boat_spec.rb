require "../lib/boat"

RSpec.describe Boat do
  before :each do
    @kayak = Boat.new(:kayak, 20)
  end

  it 'is a kayak' do
    expect(@kayak.type).to eq(:kayak)
  end

  it 'is 20 per hour' do
    expect(@kayak.price_per_hour).to eq(20)
  end

  it 'has not been rented yet' do
    expect(@kayak.hours_rented).to eq(0)
  end

  it 'has been used 1 hour' do
    @kayak.add_hour
    expect(@kayak.hours_rented).to eq(1)
  end

end
