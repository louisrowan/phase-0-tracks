require_relative 'game'

describe Game do
	it "Returns guess" do
		game = Game.new
		expect(game.guess("b")).to eq "b"
	end
end