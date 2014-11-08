class Towers_of_Hanoi
  def initialize discs
    @game = [ (1..discs).to_a.reverse!, [], [] ]
    @solution = (1..discs).to_a.reverse!
  end

  def display_game
    puts "\n#{@game.to_s}"
    puts
  end

  def play_game
    display_game
    until solved?
      puts "Board State:"
      display_game
      take_turn
    end

    puts "Congrats, you win!"
    display_game
  end


  private
  def make_move home, destination
    @game[destination - 1]<< @game[home - 1].pop
  end

  def take_turn
    puts "All moves label piles from 1 - 3, where do you want to move?"
    puts "Source pile?"
    home =gets.to_i
    puts "Which pile to?"
    destination = gets.to_i

    if valid_move? home, destination
      make_move home, destination     
    end
  end

  def solved?
    @game[1] == @solution || @game[2] == @solution
  end

  def valid_move? home, destination
    truthy_home = !@game[home - 1].empty?
    truthy_dest = @game[destination-1].empty? || @game[home - 1].last < @game[destination - 1].last
    truthy_home && truthy_dest
  end
end




if $PROGRAM_NAME == __FILE__
  tower_game = Towers_of_Hanoi.new(3)
  tower_game.play_game
end

