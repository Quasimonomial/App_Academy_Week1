def ask_player_choice
  choice = -1
  until valid_input? choice
    puts "Rock, Paper, or Scissors? (pick 0, 1, or 2)" 
    choice = gets.chomp.to_i
  end
  choice
end

def choose_computer_choice
  comp_choose = Random.new
  comp_choose.rand(0..2)
end

def determine_result(player_choice, computer_choice)
  # 0 is a tie, 1 is player victory, 2 is computer victory
  return 0 if player_choice == computer_choice
  return 1 if (player_choice - 1) == computer_choice ||
    (player_choice + 2) == computer_choice
  2 
end

def num_to_name(num)
  rps_names = ["Rock", "Paper", "Scissors"]
  rps_names[num]
end

def print_output player, comp, win
  result_string = ["It has been a tie!  Not much has changed.",
    "You are victorious!",
    "You aren't very good at this game and never will be."]
  puts "You have choosen #{num_to_name(player)}! A fine choice!"
  puts "The computer has chosen #{num_to_name(comp)}! Oh no!"
  puts result_string[win]
end


def rps
  player_choice = ask_player_choice
  computer_choice = choose_computer_choice
  winner = determine_result(player_choice, computer_choice)
  
  print_output(player_choice, computer_choice, winner)
end

def valid_input? choice
  choice <= 2 && choice >= 0
end

if $PROGRAM_NAME == __FILE__
  rps
end
