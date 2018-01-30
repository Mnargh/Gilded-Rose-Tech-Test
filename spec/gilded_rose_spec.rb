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

    it "Aged Brie increases in quality the older it gets" do
      items = [Item.new("Aged Brie", 5, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 4
      expect(items[0].quality).to eq 21
    end

    it "The Quality of an item is never over 50" do
      items = [Item.new("Aged Brie", 5, 49)]
      # add backtage passes to items list here
      gr = GildedRose.new(items)
      gr.update_quality()
      expect(items[0].quality).to eq 50
      gr.update_quality()
      expect(items[0].quality).to eq 50
    end

    it "Sulfuras never has to be sold" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end

    it "Sulfuras does not decrease in quality" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it "Backstage Passes increase in quality by 1 each day, with more than 10 days till sell_in date" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 5)]
      gr = GildedRose.new(items)
      gr.update_quality
      expect(items[0].quality).to eq 6
    end
  end

end
