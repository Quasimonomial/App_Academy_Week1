#stole some array extending functionality form this guy:
# => http://www.dzone.com/snippets/full-intersection-between-2
class Array
  def real_intersection(arr2)
    self_sorted = self.sort
    target_sorted = arr2.sort
    intersection= []
    jstart=0
    for i in (0..self_sorted.length-1)
      for j in (jstart..target_sorted.length-1)
        if self_sorted[i] == target_sorted[j]
          jstart = j+1
          intersection[intersection.length] = self_sorted[i]
          break
        end
      end
    end
    return intersection
  end
end

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

    while turns_taken < @allowed_turns
      turns_taken += 1
      puts "This is turn #{turns_taken}"
      if take_turn
        puts "The secret code was #{@secret_code.convert_to_string}"
        puts "The Code Breaker has won!"
        return
      end
    end
    puts "The Code Breaker has took #{@allowed_turns} turns, Vault Keeper wins!"
    puts "The secret code was #{@secret_code.convert_to_string}"
  end

  def take_turn #returns true if the player guesses it and false otherwise
    break_attempt = @code_breaker.get_break_attempt
    puts "Code Guess is #{break_attempt.convert_to_string}"
    return true if break_attempt == @secret_code

    exact_matches = @secret_code.exact_matches(break_attempt)
    near_matches  = @secret_code.near_matches(break_attempt)
    puts "There are #{exact_matches} exact matches."
    puts "There are #{near_matches} near matches."
    @code_breaker.update_guess_progress(exact_matches, near_matches)
    false
  end
end

class ComputerPlayer
  def initialize
    @exact_matches = 0
    @near_matches = 0
    @guess_history = []
  end

  def generate_code
    secret_code = []
    4.times { secret_code << rand(6)}
    Code.new(secret_code)
  end

  def get_break_attempt
    #must change this for the computer to be smart, for now it just guesses randomly
    unless @last_code
      @last_code = Code.new([0,0,0,0])
      return Code.new([0,0,0,0]) #return the first code if we have no code history
    end
    current_code_array = @last_code.deep_copy.code
    current_code_array = increment_code_attempt(current_code_array)
    while !possible_guess?(current_code_array)
      #p "generating a possible guess with #{current_code_array} against last code of #{@last_code.code}"
      break if current_code_array == [5, 5, 5, 5]
      current_code_array = increment_code_attempt(current_code_array)
    end
     @last_code = Code.new(current_code_array)
    Code.new(current_code_array)
  end

  def update_guess_progress exact, near
    @exact_matches = exact
    @near_matches = near
   
  end

  private
  def increment_code_attempt code_array #returns the next code from the possibility feild
    code_array[0] += 1
    code_array.each_with_index do |peg, index|
      if peg >= 6
        code_array[index] = 0
        code_array[index + 1] += 1
      end
    end
    code_array
  end

  def possible_guess? code_array
    guess = Code.new(code_array)
    # p "Testing Code versus current:"
    # p code_array
    # p "exact matches:  #{@last_code.exact_matches(guess)}"
    # p "near matches: #{ @last_code.near_matches(guess)}"
    @last_code.exact_matches(guess) == @exact_matches && @last_code.near_matches(guess) == @near_matches
  end

end

class HumanPlayer
  def initialize
    @exact_matches = 0
    @near_matches = 0
  end

  def generate_code
    puts "What code do you want the other player to try to guess?"
    code = []
    while code.length < 4
      puts "pick a number 0:Red, 1:Orange, 2:Yellow, 3:Green, 4:Blue, 5:Indigo"
      this_num = gets.chomp.to_i
      code << this_num
    end
    secret_code = Code.new(code)
    p "Generateing Code #{secret_code.convert_to_string}"
    secret_code
  end

  def get_break_attempt
    puts "enter in your best guess!"
    guess = []
    while guess.length < 4
      puts "pick a number 0:Red, 1:Orange, 2:Yellow, 3:Green, 4:Blue, 5:Indigo"
      this_num = gets.chomp.to_i
      guess << this_num
    end
    break_attempt = Code.new(guess)
    p break_attempt.convert_to_string
    break_attempt
  end

  def update_guess_progress exact, near
    #not that this matters at all for human players
    @exact_matches = exact
    @near_matches = near
  end
end

class Code
  attr_accessor :code

  def initialize code
    @code = code
  end

  def == break_attempt
    @code == break_attempt.code
  end
 
  def deep_copy
    Code.new(@code.dup)
  end

  def convert_to_string
      colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"] #violet is unused oh well we wanted a rainbow
      pretty_code = @code.map{ |color| colors[color]}
  end

  def exact_matches break_attempt
    matches = 0
    break_attempt.code.each_with_index do |peg, i|
      matches += 1  if peg == @code[i]
    end
    matches
  end

  def near_matches break_attempt
    (@code.real_intersection(break_attempt.code)).length - self.exact_matches(break_attempt)
  end
end

if $PROGRAM_NAME == __FILE__
  comp = ComputerPlayer.new
  person = HumanPlayer.new
  game = Game.new(person, comp, 10)
  game.play_game
end

