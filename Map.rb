class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair_idx = @map.index { |el| el.first == key }
    pair_idx ? @map[pair_idx][1] = value : @map.push([key, value])
    [key, value]
  end

  def lookup(key)
    @map.each { |el| return el.last if el.first == key }
    nil
  end

  def remove(key)
    @map.reject! { |el| el.first == key }
    nil
  end

  def show
    @map.deep_dup
  end

end

class Array
  def deep_dup
    self.map { |el| el.is_a?(Array) ? el.deep_dup : el }
  end
end
