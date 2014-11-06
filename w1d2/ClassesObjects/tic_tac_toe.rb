class Board
  
  def initialize
    @board_state = [['-','-','-'],
                    ['-','-','-'],
                    ['-','-','-']]
  end
 
  def board_state
    @board_state
  end

  def display_board
    p @board_state[0]
    p @board_state[1]
    p @board_state[2]
    puts ' '
  end
  
  def deep_copy
    clone = Board.new
    @board_state.each_with_index do |row, index_1|
      row.each_with_index do |element, index_2|
        clone.board_state[index_1][index_2] = @board_state[index_1][index_2]
      end
    end
    clone
  end

  def is_tied?
    (0..2).each do |x|
      (0..2).each do |y|
        if @board_state[x][y] == '-'
          return false
        end
      end
    end
    true
  end    

  def legal_move? x, y
    @board_state[x][y] == '-'
  end
  
  def make_move x, y, player #player is "X" or "0"
    @board_state[x][y] = player
  end

  def change_table x, y, player
    @board_state[x][y] = player
  end

  def winner?
    (0..2).each do |x|
      if [@board_state[x][0],@board_state[x][1], @board_state[x][2]].uniq.count == 1 && @board_state[x][0] != '-'
        return true
      end
    end
    (0..2).each do |y|
      if [@board_state[0][y], @board_state[1][y], @board_state[2][y]].uniq.count == 1 && @board_state[0][y] != '-'
        return true
      end
    end
    if ([@board_state[1][1], @board_state[2][2], @board_state[0][0]]).uniq.count == 1 && @board_state[0][0] != '-'
      return true
    elsif
      ([@board_state[0][2], @board_state[1][1], @board_state[2][0]]).uniq.count == 1 && @board_state[2][0] != '-'
      return true
    else 
      return false
    end
  end
  
  
end    
  

class HumanPlayer
  def initialize(colors)
    @colors = colors
  end
  
  def colors
    @colors
  end
  
  def get_move board
    #puts "Human"
    puts "x value?"
    x = gets.chomp.to_i
    puts "y value?"
    y = gets.chomp.to_i
    return [ y , x ]
  end    
end


class ComputePlayer
  def initialize(colors, board_state)
    @colors = colors
    @board_master = board_state
  end
  def colors
    @colors
  end
  
  def check_win(x, y, board)
    current_board_copy = board.deep_copy 
    return false if !current_board_copy.legal_move?(x, y)
    current_board_copy.change_table(x, y, @colors)
    return current_board_copy.winner?
  end
  
  def get_move board
    (0..2).each do |x|
      (0..2).each do |y|
        return [x, y] if check_win(x, y, board)
      end
    end
    return[Random.new.rand(0..2), Random.new.rand(0..2)]
  end
end

class Game
  
  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @active_player = player1
    @board.display_board
  end

  
  def make_move?(x, y, player)
    if @board.legal_move?(x, y)
      @board.make_move(x, y, player)
      return true
    end
    false
    
  end
  
  def turn
    while true
      move = @active_player.get_move(@board)
      valid_move = make_move?(move[0], move[1], @active_player.colors)
      break if valid_move
    end
    
    @board.display_board  
    self.switch
    
    
    if @board.winner?
      switch
      puts "Game over! The winner is #{@active_player}"
    elsif  @board.is_tied?
      puts "Game over! The game is tied"
    else
      self.turn
    end
    
  end
  
  
  def switch
    if @active_player == @player1
      @active_player = @player2
    else
      @active_player = @player1
    end
  end

end

our_board = Board.new
person = HumanPlayer.new('X')
not_person = ComputePlayer.new('O',our_board)
grame = Game.new(our_board, person, not_person)
grame.turn

our_board.display_board