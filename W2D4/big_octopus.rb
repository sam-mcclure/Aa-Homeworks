require 'byebug'

def sluggish_octopus(arr)
  biggest = nil
  arr.each_with_index do |el, idx|
    arr.each_with_index do |el2, idx2|
      next if idx == idx2
      biggest = el if el.length > el2.length
      biggest = el2 if el.length < el2.length
    end
  end
  biggest
end

def dominant_octopus(arr)
  merge_sort(arr).last
end

def merge_sort(arr)
  return arr if arr.length <= 1
  middle = arr.length / 2
  left = merge_sort(arr.take(middle))
  right = merge_sort(arr.drop(middle))

  merge(left,right)
end

def merge(left, right)
  result = []
  prc = Proc.new{|x,y| x <=> y }

  until left.empty? || right.empty?
    if prc.call(left.first.length, right.first.length) == -1
      result << left.shift
    else
      result << right.shift
    end
  end

  result + left + right
end

def clever_octopus(arr)
  biggest_fish = nil

  arr.each do |el|
    if biggest_fish.nil? || el.length > biggest_fish.length
      biggest_fish = el
    end
  end
  biggest_fish
end

def slow_dance(tile)
  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

  tiles_array.each_with_index do |el, idx|
    return idx if el == tile
  end

end

def constant_dance(tile)
  tiles_hash = {"up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7}

  tiles_hash[tile]
end

arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish_octopus(arr)
p dominant_octopus(arr)
p clever_octopus(arr)
p slow_dance("down")
p constant_dance("down")
