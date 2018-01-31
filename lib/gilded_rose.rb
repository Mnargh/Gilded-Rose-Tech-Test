class GildedRose
  NORMAL = "+5 Dexterity Vest"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  BRIE = "Aged Brie"
  PASS = "Backstage passes to a TAFKAL80ETC concert"

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      if item.name == NORMAL
        update_normal_item(item)
      end

      if item.name == SULFURAS
        update_sulfuras(item)
      end

      if item.name == BRIE
        update_brie(item)
      end

      if item.name == PASS
        update_pass(item)
      end
    end
  end

end
