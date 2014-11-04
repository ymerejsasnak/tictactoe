class Player
	attr_accessor :name, :mark, :moves
	def initialize(name, mark)
		@name = name
 		@mark = mark
    @moves = []
 	end
end



class Board
 	attr_accessor :grid
 	def initialize
 		@grid = Array.new(9) { " " } #cells numbered 0 to 9 starting at top left
 	end

 	def show_board
 		puts
    puts " 0)  |1)  |2)   "
 		puts "   #{@grid[0]} |  #{@grid[1]} |  #{@grid[2]} "
    puts "     |    |     "
 		puts " -------------- "
 		puts " 3)  |4)  |5)   " 
    puts "   #{@grid[3]} |  #{@grid[4]} |  #{@grid[5]} "
 		puts "     |    |     "
    puts " -------------- "
 		puts " 6)  |7)  |8)   "
    puts "   #{@grid[6]} |  #{@grid[7]} |  #{@grid[8]} "
 		puts
    puts
 	end
end



class Game
	attr_accessor :player_one, :player_two, :board, :current_player, :win_conditions

  def initialize
		@player_one = Player.new("Player 1", "X")
    @player_two = Player.new("Player 2", "O")
    @board = Board.new
    @win_conditions = [[0,1,2], [3,4,5], [6,7,8],
                      [0,3,6], [1,4,7], [2,5,8],
                      [0,4,8], [2,4,6]]
  end

  def mark_cell(cell, player)
    board.grid[cell] = player.mark
    player.moves << cell
 	end

  def get_input(player)
    begin
      puts
      print "#{player.name} (#{player.mark}) please choose a cell (0 - 9): "
      input = gets.chomp.to_i
    end until valid?(input)
    return input
  end

  def valid?(cell)
    if board.grid[cell] == " "
      return true
    else
      return false
    end
  end

  def end?(player)
    if winner?(player)
      puts
      puts "***********************"
      puts "** You win #{player.name}! **"
      puts "***********************"
      puts
      return true
    else
      if draw?
        puts
        puts "==== Draw game ===="
        puts
        return true
      else
        return false
      end
    end
  end

  def winner?(player)
    win_conditions.any? { |cells| cells.all? { |cell| player.moves.include?(cell) } }
  end

  def draw?
    return ((player_one.moves.size + player_two.moves.size) == 9)
  end

  def game_loop

      board.show_board 

    loop do   #repetetive...DRY!!
      mark_cell(get_input(player_one), player_one)
      board.show_board 
      break if end?(player_one)
      
      mark_cell(get_input(player_two), player_two)
      board.show_board
      break if end?(player_two)
    end
    
  end

end



g = Game.new
g.game_loop