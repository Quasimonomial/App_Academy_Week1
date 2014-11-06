def Towers_of_Hanoi(pieces)
  array1 = (1..pieces).to_a.reverse!
  array2 = []
  array3 = []
  game = [array1, array2, array3]
  solution = (1..pieces).to_a.reverse!
  print game 
  puts ''
  while game[2] != solution
    puts "Which pile from?"
    home = gets.to_i#.chomp
    if game[home - 1].empty?
      puts "invalid move"
      next
    end      
    puts "Which pile to?"
    destination = gets.to_i    
    if game[destination-1].empty? or game[home - 1].last < game[destination - 1].last
      game[destination - 1]<<game[home - 1].pop
    else
      puts "invalid move"
      next
    end
    print game 
    puts ''
    print solution
    puts ''
    
  end
  puts "you solved the puzzle" 
end



Towers_of_Hanoi(3)