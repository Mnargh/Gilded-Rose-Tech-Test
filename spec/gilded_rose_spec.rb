require './lib/gilded_rose'

describe GildedRose do

  describe "Update_quality" do

    it "Can access the items stored" do
      items = [Item.new("+5 Dexterity Vest", 10, 20)]
      GildedRose.new(items)
      expect(items[0].sell_in).to eq 10
      expect(items[0].quality).to eq 20
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

    context "Normal items" do
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
    end

    context "Aged Brie" do
      it "Aged Brie increases in quality the older it gets" do
        items = [Item.new("Aged Brie", 5, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 4
        expect(items[0].quality).to eq 21
      end
    end


    context "Sulfuras" do
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
    end

    context "backstage Passes" do
      it "Backstage Passes increase in quality by 1 each day, with more than 10 days till sell_in date" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 5)]
        gr = GildedRose.new(items)
        gr.update_quality
        expect(items[0].quality).to eq 6
      end

      it "Backstage Passes increase in quality by 2 each day when between 10 and 5 days till sell_in date" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 5)]
        gr = GildedRose.new(items)
        gr.update_quality
        expect(items[0].quality).to eq 7
        4.times{gr.update_quality}
        expect(items[0].sell_in).to eq 5
        expect(items[0].quality).to eq 15
      end

      it "Backstage Passes increase in quality by 2 each day when between 10 and 5 days till sell_in date" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 5)]
        gr = GildedRose.new(items)
        gr.update_quality
        expect(items[0].quality).to eq 7
        4.times{gr.update_quality}
        expect(items[0].sell_in).to eq 5
        expect(items[0].quality).to eq 15
      end

      it "Backstage Passes increase in quality by 3 each day when between 5 days and the sell_in date" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 5)]
        gr = GildedRose.new(items)
        gr.update_quality
        expect(items[0].quality).to eq 8
        4.times{gr.update_quality}
        expect(items[0].sell_in).to eq 0
        expect(items[0].quality).to eq 20
      end

      it "Backstage Passes decrease to 0 in quality after the sell_in date has passed" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 5)]
        gr = GildedRose.new(items)
        gr.update_quality
        expect(items[0].quality).to eq 0
      end
    end

    context "Conjured items" do
      # it "Conjured items degrade in quality twice as fast as normal items before sell_in date" do
      #   items = [Item.new("Conjured Mana Cake", 5, 30)]
      #   GildedRose.new(items).update_quality
      #   expect(items[0].quality).to eq 28
      # end
      
        # it "Conjured items degrade in quality twice as fast as normal items after sell_in date" do
        #   items = [item.new("Conjured Mana Cake", 0, 30)]
        #   GildedRose.new(items).update_quality
        #   expect(items[0].quality).to 24
        # end
    end

  end

end
