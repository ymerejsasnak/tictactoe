class Player
	attr_accessor :name, :mark
	def initialize(name, mark)
		@name = name
 		@mark = mark
 	end

end



class Board
 	attr_accessor :grid
 	def initialize
 		@grid = Array.new(9) { " " } #cells numbered 0 to 9 starting at top left
 	end

 	def show_board
 		puts
 		puts "   #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
 		puts " ------------- "
 		puts "   #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
 		puts " ------------- "
 		puts "   #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
 		puts
 	end

end



class Game
	attr_accessor :player_one, :player_two, :board, :current_player
	def initialize
		@player_one = Player.new("Player 1", "X")
    @player_two = Player.new("Player 2", "O")
    @board = Board.new
    @current_player = @player_one
  end

  def mark_cell(cell)
    board.grid[cell] = current_player.mark
    board.show_board
 	end

  def game_loop
  end

end

g = Game.new