def bubble_sort(arr)
  length = arr.length
  last_index = length
  last_index.downto(1) do |i|
    (0...i).each do |j|
      break if arr[j+1].nil?
      if (arr[j] > arr[j+1])
        arr[j], arr[j+1] = arr[j+1], arr[j]
      end
    end
  end
  arr
end
arr = [14, 33, 27, 35, 10]
puts "Bubble Sorted Array #{bubble_sort(arr)}"