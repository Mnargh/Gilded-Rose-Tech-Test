class Brie

attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    @sell_in -= 1
    @quality += 1 unless @quality == 50
    @quality += 1 if @sell_in < 0
  end
end
