require './lib/gilded_rose'

describe GildedRose do

  describe "Update_quality" do
    it "Can access the items stored" do
      items = [Item.new("+5 Dexterity Vest", 10, 20)]
      GildedRose.new(items)
      expect(items[0].sell_in).to eq 10
      expect(items[0].quality).to eq 20
    end

    it "Item quality decreases by 1 every day" do
      items = [Item.new("+5 Dexterity Vest", 10, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
      expect(items[0].quality).to eq 19
    end
  end

end
