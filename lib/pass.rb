require_relative 'item'

class Pass < Item

  def update
    reduce_sell_in
    return if maximum_quality
    return @quality = 0 if expired?
    increase_quality(1)
    increase_quality(1) if @sell_in < 10
    increase_quality(1) if @sell_in < 5
  end
end
