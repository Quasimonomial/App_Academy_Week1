def switch!(arr, pos)
  if arr[pos] > arr[(pos + 1)]
    arr[pos], arr[pos + 1] = arr[pos + 1], arr[pos]
  end
  arr
end

def bubble_sort list 
  sorted_list = list
  position_max = list.length
  while position_max > 0
    (0...position_max - 1).each do |position|
      switch!(sorted_list, position)
    end
    position_max -= 1
  end
  sorted_list
end


if $PROGRAM_NAME == __FILE__
  print bubble_sort([2, 4, 3, 2 , 6, 3, 3, 5, 10, 102, 20, 12, 4, 4, 7])
end

