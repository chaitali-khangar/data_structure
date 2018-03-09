def selection_sort(arr)
  last_index = arr.length - 1
  (0..last_index).each do |i|
    (i..last_index).each do |j|
      if arr[i] > arr[j]
        arr[i], arr[j] = arr[j], arr[i]
      end
    end
  end
  arr
end
arr = [14, 33, 27, 35, 10, 2]
puts "Selection Sorted Array #{selection_sort(arr)}"