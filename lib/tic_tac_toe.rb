class Game
	attr_accessor :board_array, :current_player, :player2

	def initialize
		@board_array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
		@board = Board.new()
		@player1 = Player.new("x")
	end

	def start
		print_instructions()
		choose_opponents()
		@board.draw(@board_array)

		puts "Player 1 will go first"

		while (!game_over?)
			switch_players
			@current_player.move(@board_array)
			@board_array[@current_player.player_moves.last.to_i - 1] = @current_player.mark
			@board.draw(@board_array)
		end

		restart if(play_again?)
	end

	def print_instructions()
		puts "Welcome to Tic-Tac-Toe!"

		puts "To win you must place three of your marks (either an 'x' or an 'o') in a horizontal, vertical, or diagonal row."
	end

	def choose_opponents()
		puts "Choose your opponent (Player 2): "
		puts "1: Human"
		puts "2: Computer"
		get_opponent()
	end

	def get_opponent()
		opponent = gets.chomp
		if opponent == "1" || opponent.downcase == "human"
			@player2 = Player.new("o")
			@current_player = @player2
		elsif opponent == "2" || opponent.downcase == "computer"
			@player2 = Computer.new("o")
			@current_player = @player2
		else
			choose_opponents()
		end
	end

	def switch_players()
		if @current_player == @player1
			@current_player = @player2
			puts "Current Player: Player 2"
		else
			@current_player = @player1
			puts "Current Player: Player 1"
		end
	end

	def winning_moves()
		return [[1,2,3], [4,5,6], [7,8,9],[1,4,7],[2,5,8],[3,6,9], [1,5,9],[3,5,7]]
	end

	def game_over?()
		if check_win()
			print_winner
			return true
		elsif board_full?
			print_no_winner()
			return true
		else
			return false
		end
	end

	def check_win()
		#check whether the current player has won
		return false if @current_player  == nil
		
		a = @current_player.player_moves

		winning_moves.each do |array|
			if (array - a).empty?
				return true
			end
		end
		return false
	end

	def print_winner
		if @current_player == @player1
			player = "Player 1"
		else 
			player = "Player 2"
		end
		puts "Congratulations #{player}!"
		puts "You Win!"
	end

	def board_full?
		@board_array.each do |i|
			if !(i == "x" || i == "o")
				return false
			end
		end
		return true
	end

	def print_no_winner
		puts "Tie!"
		puts "No Winner"
	end

	def play_again?
		puts "Play Again? (y/n)"
		response = gets.chomp
		if(response.downcase == "y" || response.downcase == "yes")
			return true
		else
			return false
		end
	end

	def restart
		@board_array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
		@board = Board.new()
		@player1 = Player.new("x")

		start()
	end
end
	
class Board

	def initialize
	end

	def draw(board_array)
		#puts board
		puts board_array[0] + " | " + board_array[1] + " | " + board_array[2]
		puts "-----------"
		puts board_array[3] + " | " + board_array[4] + " | " + board_array[5]
		puts "-----------"
		puts board_array[6] + " | " + board_array[7] + " | " + board_array[8]
	end
end

class Player
	attr_accessor :player_moves, :mark

	def initialize(mark)
		@player_moves = []
		@mark = mark
	end

	def move(board_array)
		puts "Make your move: "
		move = gets.chomp
		if valid_move?(move, board_array)
			@player_moves.push(move.to_i) 
		end
	end

	def valid_move?(move, board_array)
		if (move.to_i > 0 && move.to_i < 10) && (board_array[move.to_i - 1] != 'x' && board_array[move.to_i - 1] != 'o')
			return true
		else
			move(board_array)
			return false
		end
	end

end

class Computer < Player

	def move(board_array)
		move = 1 + rand(9)
		if valid_move?(move, board_array)
			@player_moves.push(move.to_i) 
			puts "Computer's Move: #{move}"
		end
	end
end

#game = Game.new()
#game.start