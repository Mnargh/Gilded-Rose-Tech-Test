require_relative 'item'

class Normal < Item

  def update
    reduce_sell_in
    return if minimum_quality
    reduce_quality_by_1
    reduce_quality_by_1 if expired?
  end
end
