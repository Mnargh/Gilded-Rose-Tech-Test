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

  def update_normal_item(item)
    item.sell_in -= 1
    return if item.quality == 0
    item.quality -= 1
    item.quality -= 1 if item.sell_in < 0
  end

  def update_sulfuras(item)
  end

  def update_brie(item)
    item.sell_in -= 1
    item.quality += 1 unless item.quality == 50
    item.quality += 1 if item.sell_in < 0
  end

  def update_pass(item)
    item.sell_in -= 1
    return if item.quality >= 50
    return item.quality = 0 if item.sell_in < 0
    item.quality += 1
    item.quality += 1 if item.sell_in < 10
    item.quality += 1 if item.sell_in < 5
  end

  def update_conjured(item)
    item.sell_in -= 1
    return if item.quality == 0
    item.quality -= 2
    item.quality -= 2 if item.sell_in < 0
  end


end
