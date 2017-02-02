fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# quadratic search
def sluggish_octopus(array)
  array.each_with_index do |fish1, i|
    biggest = true

    array.each_with_index do |fish2, j|
      next if i == j
      biggest = false if fish2.length > fish1.length
    end

    return fish1 if biggest
  end

end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

#n log n search
def dominant_octopus(array)
  prc = Proc.new { |x, y| y.length <=> x.length }

  array.merge_sort(&prc)[0]
end

#linear search
def clever_octopus(array)
  biggest_fish = nil
  array.each do |fish|
    biggest_fish = fish if biggest_fish.nil? || fish.length > biggest_fish.length
  end

  biggest_fish
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, array)
  array.each_with_index do |el, i|
    return i if dir == el
  end
  nil
end

tiles_hash = {
  "up" => 1,
  "right-up" => 2,
  "right" => 3,
  "right-down" => 4,
  "down" => 5,
  "left-down" => 6,
  "left" => 7,
  "left-up" => 8
}

def fast_dance(dir, hash)
  hash[dir]
end
