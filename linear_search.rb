def linear_search(array, value)
  found_index = nil
  array.each_with_index do |element, index|
    if element == value
      found_index = index
      break
    end
  end
  if found_index.nil?
    p "#{value} not Found"
  else
    p "#{value} found at position: #{found_index}"
  end
end

arr = [4,1,25,4,68,7]
linear_search(arr, 68)