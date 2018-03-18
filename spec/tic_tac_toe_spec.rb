require "tic_tac_toe"

describe Game do
	
	#start method tests
	describe "start" do
		context "generates a new game" do
			before(:example) do
				@game = Game.new()
				#@game.start()
			end
			it "initializes board array" do
				#expect (@game.board_array).to eql(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
			end
		end
	end

	#check_win method tests
	describe ".check_win" do
		before(:example) do
			@game = Game.new()
		end

		context "given an initial game" do
			it "returns false" do
				expect(@game.check_win).to eql(false)
			end
		end

		context "given a current player with no winning move" do
			it "returns false" do
				#expect(@game.check_win()).to eql(false)
			end
		end
	end

end

describe Player do

	#check_win method tests
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
	end

end
