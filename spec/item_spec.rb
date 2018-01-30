require './lib/item'

describe Item do

  let(:vest){Item.new("+5 Dexterity Vest", 10, 20)}

  it "Should initialise with name, sell_in, and quality properties" do
    expect(vest.name).to eq "+5 Dexterity Vest"
    expect(vest.sell_in).to eq 10
    expect(vest.quality).to eq 20
  end

  it "Should convert it's properties to a string" do
    expect(vest.to_s).to eq "+5 Dexterity Vest, 10, 20"
  end
end
