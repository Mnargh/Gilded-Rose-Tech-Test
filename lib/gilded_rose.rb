class GildedRose

  BRIE = "Aged Brie"
  PASS = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"

  def initialize(items)
    @items = items
    @only_increase = [BRIE, PASS]
  end

  def update_quality()
    @items.each do |item|

          return if item.name == SULFURAS
          # if only increase includes? matures, otherwise decays

          if !quality_increase_over_time?(item)
            item_decays(item)
          elsif quality_increase_over_time?(item)
            item_matures(item)
          end

          decrease_sell_in(item, 1)

          if item_out_of_date?(item)
            if item.name != BRIE
              if item.name != PASS
                    decrease_quality(item, 1)
              else
                item.quality = 0
              end
            else
                increase_quality(item, 1)
            end
          end
    end
  end

  def item_decays(item)
    decrease_quality(item, 1)
  end

  def item_matures(item)
    increase_quality(item, 1)
    backstage_pass_bonus(item) if item.name == PASS
  end

  def backstage_pass_bonus(item)
    increase_quality(item, 1) if item.sell_in < 11
    increase_quality(item, 1) if item.sell_in < 6
  end

  def quality_increase_over_time?(item)
    @only_increase.include?(item.name)
  end

  def item_out_of_date?(item)
    item.sell_in < 0
  end

  def decrease_quality(item, amount)
    item.quality -= amount unless item.quality == 0
  end

  def increase_quality(item, amount)
    item.quality += amount
    item.quality = 50 if item.quality > 50
  end

  def decrease_sell_in(item, amount)
    amount *= 2 if item_out_of_date?(item)
    item.sell_in -= amount
  end
end
