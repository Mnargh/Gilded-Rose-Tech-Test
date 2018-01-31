require_relative 'item'

class Pass < Item

  def update
    @sell_in -= 1
    return if @quality >= 50
    return @quality = 0 if @sell_in < 0
    @quality += 1
    @quality += 1 if @sell_in < 10
    @quality += 1 if @sell_in < 5
  end
end
