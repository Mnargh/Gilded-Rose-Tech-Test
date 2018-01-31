require_relative 'item'

class Normal < Item

  def update
    reduce_sell_in
    return if minimum_quality
    reduce_quality(1)
    reduce_quality(1) if expired?
  end
  
end
