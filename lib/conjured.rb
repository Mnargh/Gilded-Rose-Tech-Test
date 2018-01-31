require_relative 'item'

class Conjured < Item

  def update
    reduce_sell_in
    return if minimum_quality
    reduce_quality(2)
    reduce_quality(2) if expired?
  end
end
