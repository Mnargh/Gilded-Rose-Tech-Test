class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def reduce_sell_in
    @sell_in -= 1
  end

  def reduce_quality_by_1
    @quality -= 1
  end

  def expired?
    @sell_in < 0
  end

  def minimum_quality
    @quality == 0
  end
end
