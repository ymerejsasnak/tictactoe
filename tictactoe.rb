class Player
	attr_reader :name, :mark
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
end



class Game
	attr_accessor :player_one, :player_two
	def initialize
    @player_one = Player.new("Player 1", "X")
    @player_two = Player.new("Player 2", "O")
    @board = Board.new
  end
end


