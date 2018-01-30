class GildedRose

  BRIE = "Aged Brie"
  PASS = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != BRIE and item.name != PASS
          if item.quality > 0
              if item.name != SULFURAS
                decrease_quality(item, 1)
              end
          end
      else
          if item.quality < 50
            increase_quality(item, 1)
              if item.name == PASS
                  if item.sell_in < 11
                      if item.quality < 50
                        increase_quality(item, 1)
                      end
                  end
                  if item.sell_in < 6
                      if item.quality < 50
                        increase_quality(item, 1)
                      end
                  end
              end
          end
      end


      if item.name != SULFURAS
        decrease_sell_in(item, 1)
      end
      if item.sell_in < 0
        if item.name != BRIE
          if item.name != PASS
            if item.quality > 0
              if item.name != SULFURAS
                decrease_quality(item, 1)
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            increase_quality(item, 1)
          end
        end
      end
    end
  end

  def decrease_quality(item, amount)
    item.quality -= amount
  end

  def increase_quality(item, amount)
    item.quality += amount
  end

  def decrease_sell_in(item, amount)
    item.sell_in -= amount
  end
end
