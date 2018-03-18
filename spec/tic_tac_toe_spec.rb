require "tic_tac_toe"

describe Game do
	
	#start method tests
	describe "start" do
		context "generates a new game" do
			before(:example) do
				@game = Game.new()
			end
			it "initializes board array" do
				expect (@game.board_array).eql?(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
			end
		end
	end

	#game_over method tests
	describe ".game_over?" do
		before(:example) do
			@game = Game.new()
			@game.current_player = Player.new('o')
		end

		context "given an initial game" do
			it "returns false" do
				expect(@game.game_over?).to eql(false)
			end
		end

		context "given a current player with winning move" do
			before(:example) do
				@game.current_player.player_moves = [1,2,3]
			end
			it "returns true" do
				expect(@game.game_over?).to eql(true)
			end
		end

		context "given a current player with winning move" do
			before(:example) do
				@game.current_player.player_moves = [4,5,6]
			end
			it "returns true" do
				expect(@game.game_over?).to eql(true)
			end
		end

		context "given a current player with winning move" do
			before(:example) do
				@game.current_player.player_moves = [2,4,3,5,6]
			end
			it "returns true" do
				expect(@game.game_over?).to eql(true)
			end
		end
		
		context "given a current player with no winning move" do
			before(:example) do
				@game.current_player.player_moves = [2,4,3,5]
			end
			it "returns false" do
				expect(@game.game_over?).to eql(false)
			end
		end

		context "given a full board" do
			before(:example) do
				@game.board_array = ["x", "o", "x", "o", "x", "o", "x", "o", "x"]
			end
			it "returns true" do
				expect(@game.game_over?).to eql(true)
			end
		end

		context "given a full board" do
			before(:example) do
				@game.board_array = ["x", "x", "x", "x", "x", "x", "x", "x", "x"]
			end
			it "returns true" do
				expect(@game.game_over?).to eql(true)
			end
		end

		context "given an unfilled board" do
			before(:example) do
				@game.board_array = ["x", "x", "3", "o", "o", "6", "7", "8", "9"]
			end
			it "returns false" do
				expect(@game.game_over?).to eql(false)
			end
		end
	end
end

describe Player do
	describe ".valid_move" do
		before(:example) do
			@player = Player.new('x')
		end
		
		context "given an initial game and valid move" do
			it "returns true" do
				expect(@player.valid_move?(2, ["1", "2", "3", "4", "5", "6", "7", "8", "9"])).to eql(true)
			end
		end

		context "given a game and valid move" do
			it "returns true" do
				expect(@player.valid_move?(3, ["x", "x", "3", "x", "5", "6", "7", "8", "9"])).to eql(true)
			end
		end

		context "given a game and valid move" do
			it "returns true" do
				expect(@player.valid_move?(4, ["x", "2", "o", "4", "x", "6", "o", "8", "9"])).to eql(true)
			end
		end

		#check for invalid moves
		context "given an initial game and invalid move" do
			it "returns false" do
				expect(@player.valid_move?(12, ["1", "2", "3", "4", "5", "6", "7", "8", "9"])).to eql(false)
			end
		end

		context "given a game and invalid move" do
			it "returns false" do
				expect(@player.valid_move?("b", ["x", "x", "3", "x", "5", "6", "7", "8", "9"])).to eql(false)
			end
		end

		context "given a game and invalid move" do
			it "returns false" do
				expect(@player.valid_move?(1, ["x", "2", "o", "4", "x", "6", "o", "8", "9"])).to eql(false)
			end
		end

		context "given a game and invalid move" do
			it "returns false" do
				expect(@player.valid_move?(0, ["x", "2", "o", "4", "x", "6", "o", "8", "9"])).to eql(false)
			end
		end
	end
end
