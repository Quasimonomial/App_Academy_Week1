class Hangman
  def initialize guesser, executioner, turns_allowed
    @guesser = guesser
    @executioner = executioner
    @turns_allowed = turns_allowed
  end

  def game
    init_game
    p "Ready to Play the game"
  end

  def init_game
    p "Initing the game"
  end



end

class HumanPlayer

end

class ComputerPlayer


end




if $PROGRAM_NAME == __FILE__
  guesser = HumanPlayer.new
  executioner = ComputerPlayer.new
  game = Hangman.new(guesser, executioner, 9)
  game.game
end






# class Hangman
#   attr_accessor :turns_allowed, :turns_taken
  
#   def initialize  guesser, executioner, turns_allowed
#     @guesser = guesser
#     @executioner = executioner
#     @turns_allowed = turns_allowed
#     @death_clock = 0
#   end
  
#   def game
#     while man_alive?
#       p "while loop entered"
#       take_turn
#       if word_guessed?
#         puts "you win!"
#         return
#       end
#       #if we mess up death clock is incrimented by one in the take turn function
#     end
#     #we only exit this loop if our character is dead, otherwise we return from it
#     puts "Oh no it seems that you have died"
#   end
  
#   def man_alive?
#     @death_clock < @turns_allowed
#   end
  
#   def take_turn
#     #in this version we are going to just pass our working word as a function to the guesser, but we won't particula
#     guessed_letter = @guesser.get_letter(@executioner.working_word)
#     #this update working word for the executioner returns true or false if a change has been made
#     victory = @executioner.update_working_word(guessed_letter)
#     if !victory #dont' need to check for correct words because now update_workign_word takes care of that
#       @death_clock += 1
#     end
      
    
#   end
  
#   def word_guessed?
#     @guesser.word == @executioner.word
#   end
    
# end

# class Guesser
#   def initialize word
#     @word = word
#   end

#   def get_letter working_word
#     p 'what kind of letter would you like to choose?'
#   end
  
#   def word
#     @word
#   end
# end

# class Executioner
#   def initialize word
#     @word = word
#   end

#   def update_working_word gussed_letter
#     stuff
#   end
  
#   def word
#     @word
#   end
# end

# test_guest = Guesser.new("butts")
# test_death = Executioner.new("butts")
# test_game = Hangman.new(test_guest, test_death, 5)
# test_game.game

# test_guest2 = Guesser.new("butts")
# test_death2 = Executioner.new("not butts")
# test_game2 = Hangman.new(test_guest2, test_death2, 5)
# test_game2.game