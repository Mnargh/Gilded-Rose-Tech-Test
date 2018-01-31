class Conjured

attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    @sell_in -= 1
    return if @quality == 0
    @quality -= 2
    @quality -= 2 if @sell_in < 0
  end
end
