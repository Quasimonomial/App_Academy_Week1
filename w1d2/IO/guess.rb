def generate_computer_answer player, computer
  if player == computer
    return true
  end
  if player < computer 
    puts "Your guess is too low!"
  else
    puts "Your guess is too high!"
  end
  false
end

def guessing_game
  guess = Random.new.rand(1..100)
  guess_count = 0
  computer_answer = false
  while !computer_answer
    guess_count +=1
    player_guess = prompt_player
    computer_answer = generate_computer_answer(player_guess, guess)
  end  
  puts "You have guessed the answer in #{guess_count} guesses!"
end

def prompt_player
  puts "What is your guess?"
  gets.chomp.to_i
end

if $PROGRAM_NAME == __FILE__
  guessing_game
end