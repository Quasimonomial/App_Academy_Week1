def big_seven #finds the first number that is >250 and divisable by seven
  divide_this = 250
  while divide_this % 7 != 0
    puts divide_this
    divide_this += 1
    
  end
  puts "Answer found!"
  puts divide_this  
end
