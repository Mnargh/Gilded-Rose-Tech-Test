require_relative 'item'

class Brie < Item

  def update
    reduce_sell_in
    increase_quality(1) unless maximum_quality
    increase_quality(1) if expired?
  end
  
end
