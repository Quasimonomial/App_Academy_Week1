def picker arr
  max = -1
  position = "no profit"
  last = arr.count - 1
  
  for i in 0..last
    for j in (i + 1)..last
      if arr[j] - arr[i] > max
        position = [i, j]
        max = arr[j] - arr[i]
      end
    end
  end
  
  position
end

