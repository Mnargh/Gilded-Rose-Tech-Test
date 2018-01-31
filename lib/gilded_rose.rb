class GildedRose

  BRIE = "Aged Brie"
  PASS = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"

  def initialize(items)
    @items = items
    @only_increase = [BRIE, PASS]
  end

  def next_day
    items.each do |item|
      update_quality(item)
    end
  end

  def update_quality()
    @items.each do |item|
      return if item.name == SULFURAS
      quality_increase_over_time?(item) ? item_matures(item) : item_decays(item)
      decrease_sell_in(item, 1)
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
    item.quality = 0 if item_out_of_date?(item)
  end

  def quality_increase_over_time?(item)
    @only_increase.include?(item.name)
  end

  def item_out_of_date?(item)
    item.sell_in < 0
  end

  def decrease_quality(item, amount)
    amount *= 2 if item_out_of_date?(item)
    item.quality -= amount unless item.quality == 0
  end

  def increase_quality(item, amount)
    item.quality += amount
    item.quality = 50 if item.quality > 50
  end

  def decrease_sell_in(item, amount)
    item.sell_in -= amount
  end
end 
