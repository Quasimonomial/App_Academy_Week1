def my_transpose array
  result = []
  num = array.count - 1
  for i in 0..num
    col = []
    for j in 0..num
      col << array[j][i]
    end
    result << col
  end
  
  result
end


  