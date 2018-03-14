def quicksort(arr, lo, hi)
  if arr.length <= 1
    return arr
  else
    pivot = partition(arr, lo, hi)
    if (lo < pivot-1)
      quicksort(arr, lo, pivot-1)
    end
    if (hi > pivot)
      quicksort(arr, pivot, hi)
    end
    return arr
  end
  
end

# partition function (selects a pivot, sorts into partitions, and returns the array index of the pivot)
def partition(arr, lo, hi)
  pivot = arr[hi]

  left = lo
  (lo...hi).each do |element|
    if arr[element] <= pivot
      arr[left], arr[element] = arr[element], arr[left]
      left += 1
    end
  end
  
  arr[left], arr[hi] = arr[hi], arr[left]
  return left
  
end

test = (1..0).to_a.shuffle
quicksort(test, 0, test.length-1)

if test == (1..0).to_a
    puts 'The sort worked!'
else
    puts 'Noooo, the sort failed!'
end