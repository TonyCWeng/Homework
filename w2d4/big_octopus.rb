fishes = [
  'fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh',
  'fsh', 'fiiiissshhhhhh'
]

def sluggish_octopus(arr)
  longest = arr[0]
  arr.each do |fish1|
    arr.each do |fish2|
      if fish1.length > fish2.length && fish1.length > longest.length
        longest = fish1
      end
    end
  end
  longest
end

#not sure how to switch it to strings. But yes, its merge sort
def merge_sort(arr, &prc)
  prc ||= Proc.new{|x,y| x <=> y}
  return arr if arr.length <= 1
  mid = arr.length / 2
  sorted_left = merge_sort(arr[0, mid], &prc)
  sorted_right = merge_sort(arr[mid, arr.length], &prc)
  merge(sorted_left, sorted_right, &prc)
end

def merge(left, right, &prc)

  merged = []
  until left.empty? || right.empty?
    if prc.call(left.first, right.first) == -1
      merged << left.shift
    else
      merged << right.shift
    end
  end
  merged + left + right
end

def dominant_octopus(arr)
  prc = Proc.new {|x,y| x.length <=> y.length}
  merge_sort(arr, &prc).last
end

def clever_octopus(arr)
  longest = arr[0]
  arr.each do |fish|
    if fish.length > longest.length
      longest = fish
    end
  end
  longest
end

#Dancing Octopus
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end

new_tiles_structure = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}
def slow_dance(dir, new_tiles_structure)
  new_tiles_structure[dir]
end
