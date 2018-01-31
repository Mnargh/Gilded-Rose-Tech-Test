require_relative 'item'

class Brie < Item

  def update
    @sell_in -= 1
    @quality += 1 unless @quality == 50
    @quality += 1 if @sell_in < 0
  end
end
