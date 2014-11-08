class Game
  def initialize vault_keeper, code_breaker, allowed_turns
    @vault_keeper = vault_keeper
    @code_breaker = code_breaker
    @allowed_turns = allowed_turns
  end

  def get_code
    @secret_code = @vault_keeper.generate_code
  end

  def play_game
    get_code

    turns_taken = 0

    while turns_taken <= @allowed_turns
      turns_taken += 1
      puts "This is turn #{turns_taken}"
      if take_turn
        puts "The secret code was #{@secret_code.convert_to_string}"
        puts "The Code Breaker has won!"
        break
      end

    end
    puts "The Code Breaker has took #{@allowed_turns}, Vault Keeper wins!"
    puts "The secret code was #{@secret_code.convert_to_string}"

  end

  def take_turn #returns true if the player guesses it and false otherwise
    break_attempt = @code_breaker.get_break_attempt
    puts "Code Guess is #{break_attempt.convert_to_string}"
    return true if break_attempt == @secret_code
    puts "There are #{@secret_code.exact_matches(break_attempt) exact matches.}"
    puts "There are #{@secret_code.near_matches(break_attempt) near matches.}"
    @code_breaker.update_guess_progress(@secret_code.exact_matches, @secret_code)
  end

end

# class Game
  
  
#   def input_from_user
    
#     puts "enter in your best guess!"
#     guess = []
#     while guess.length < 4
#       puts "pick a number 0:Red, 1:Green, 2:Yellow, 3:Orange, 4:Purple, 5:Blue"
#       this_num = gets.chomp.to_i
#       guess << this_num
#     end
#     p guess
#     guess
#   end



class ComputerPlayer
  def initialize
    @exact_matches = 0
    @near_matches = 0
  end

  def update_guess_progress exact, near
    @exact_matches = exact
    @near_matches = near
  end

end

class HumanPlayer

end

class Code
  attr_reader :code

  def initialize code
    @code = code
  end

  def == break_attempt
    @code == break_attempt.code
  end

  def convert_to_string
      colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"] #violet is unused oh well we wanted a rainbow
      pretty_code = @code.map{ |color| colors[color]}
  end

  def exact_matches break_attempt
    matches = 0
    break_attempt.each_with_index do |peg, i|
      matches += 1  if peg == @code[i]
    end
    matches
  end

  def near_matches break_attempt
    (break_attempt & @code).length - self.exact_matches(break_attempt)
  end
end
  






# if $PROGRAMNAME == __FILE__
#   our_code = Code.new
#   game = Game.new(our_code, 10)
#   game.game
# end

#   def generate_secret_code
#     secret_code = []
#     4.times do 
#       secret_code << rand(0..5)
#     end
#     secret_code
#   end
