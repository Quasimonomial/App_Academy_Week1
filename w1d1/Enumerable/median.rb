def median arr
  new_arr = arr.sort!
  idx = arr.length
  if idx % 2 == 1
    return new_arr[(idx - 1) / 2]
  else
    half = idx / 2
    return ((new_arr[half - 1] + new_arr[half]) / 2.0 )
  end
end

  