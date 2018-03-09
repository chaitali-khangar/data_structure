def insertion_sort(arr)
  last_index = arr.length - 1
  (0..last_index).each do |i|
    (0...(i+1)).each do |j|
      break if arr[j].nil?
      if arr[j] > arr[i]
        arr[i], arr[j] = arr[j], arr[i]
      end
    end
  end
  arr
end
arr = [14, 33, 27, 35, 10, 2]
puts "Insertion Sorted Array #{insertion_sort(arr)}"