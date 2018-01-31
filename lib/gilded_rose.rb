class GildedRose
  NORMAL = "+5 Dexterity Vest"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  BRIE = "Aged Brie"
  PASS = "Backstage passes to a TAFKAL80ETC concert"

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.update
    end
  end

end
