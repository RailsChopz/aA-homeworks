FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(arr, &prc)
  prc ||= Proc.new { |x, y| x <=> y }
  result = 0
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      result = j if prc.call(arr[i].length, arr[j].length) == -1
      result = i if prc.call(arr[i].length, arr[j].length) == 1
      result = i if prc.call(arr[i].length, arr[j].length) == 0
      j +=  1
    end
    i += 1
  end
  arr[result]
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return arr if arr.length <= 1
    pivot = arr.first
    left = arr.take(pivot).dominant_octopus(&prc)
    right = arr.drop(pivot).dominant_octopus(&prc)

    merge(left, right, &prc).last
  end

  private
  def merge(left, right, &prc)
    merged = []
    until left.empty || right.empty?
      case prc.call(left.first, right.first)
      when 0
        merged << left.shift
      when -1
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

def biggest_fish(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fishes.merge_sort(&prc).first
end

def linear_biggest_fish(fishes)
  biggest_fish = fishes.first

  fishes.each do |fish|
    if fish.length > biggest_fish.length
      biggest_fish = fish
    end
  end

  biggest_fish

end

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
