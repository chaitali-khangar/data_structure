array = [10, 14, 19, 26, 27, 31, 33, 35, 42, 44]
search = 121

def binary_search(array, search)
  first = 0
  last = array.length - 1
  while first <= last
    mid = (first + last)/2
    if array[mid] == search
      return "Index of #{search} is #{array.index(search)}"
    elsif array[mid] > search && array[first] <= search
      last = mid - 1
    elsif array[mid] < search && array[last] >= search
      first = mid + 1
    else
      return "#{search} not found in array"
    end
  end
end
puts binary_search(array.sort, search)