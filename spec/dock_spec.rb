require "../lib/dock"
require "../lib/renter"
require "../lib/boat"


RSpec.describe Dock do
  before :each do
    @dock = Dock.new("The Rowing Dock", 3)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Krabs", "1313131313131313")
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)

  end

  it "exists" do
    expect(@dock).to be_instance_of(Dock)
    expect(@dock.name).to eq("The Rowing Dock")
    expect(@dock.max_rental_time).to eq(3)
  end

  it "has 1 renter" do
    @dock.rent(@kayak_1, @patrick)
    expect(@dock.rental_log.length).to eq(1)
  end

  it "has 3 renters" do
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)
    expect(@dock.rental_log.length).to eq(3)
  end

  it "charges 40 for kayak 1" do

    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)

    @kayak_1.add_hour
    @kayak_1.add_hour


    the_charge = @dock.charge(@kayak_1)
    expect(the_charge[:amount]).to eq(40)
  end

  it "charges 45 for sup_1, does not go over" do
    @dock.rent(@sup_1, @eugene)

    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    # these shouldn't count because the Dock's max rental time is 3 hours
    @sup_1.add_hour
    @sup_1.add_hour

    the_charge = @dock.charge(@sup_1)
    expect(the_charge[:amount]).to eq(45)

  end

  it "charges 40 for kayak_2, does not go over" do
    @dock.rent(@kayak_2, @eugene)

    @kayak_2.add_hour
    @kayak_2.add_hour
    @kayak_2.add_hour
    @kayak_2.add_hour
    @kayak_2.add_hour
    @kayak_2.add_hour

    expect(@dock.charge(@kayak_2)[:amount]).to eq(60)
  end


  # require "pry"; binding.pry;

end
