require './lib/gilded_rose'

describe GildedRose do

  describe "Update_quality" do
    it "Can access the items stored" do
      items = [Item.new("+5 Dexterity Vest", 10, 20)]
      GildedRose.new(items)
      expect(items[0].sell_in).to eq 10
      expect(items[0].quality).to eq 20
    end

    it "Ordinary item quality and sell_in decreases by 1 every day" do
      items = [Item.new("+5 Dexterity Vest", 10, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
      expect(items[0].quality).to eq 19
    end

    it "Item quality can not be negative" do
      items = [Item.new("+5 Dexterity Vest", 10, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
      expect(items[0].quality).to eq 0
    end

    it "Item quality decreases twice as fast once the sell by date has passed" do
      items = [Item.new("+5 Dexterity Vest", 1, 20)]
      gr = GildedRose.new(items)
      gr.update_quality()
      expect(items[0].sell_in).to eq 0
      expect(items[0].quality).to eq 19
      gr.update_quality()
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 17
    end

    it "Aged Brie increases in quality the oder it gets" do
      items = [Item.new("Aged Brie", 5, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 4
      expect(items[0].quality).to eq 21
    end
  end

end
