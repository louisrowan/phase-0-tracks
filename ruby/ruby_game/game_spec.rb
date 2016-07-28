require_relative 'game'

describe Game do
	let (:game) {Game.new("bananas")}
	let (:answer) {"bananas"}

	it "Returns guess" do
		expect(game.guess("b")).to eq "b"
	end

	it "Returns updated array of all guesses" do
		expect(game.update_already_guessed("c")).to eq ["c"]
	end

	it "Updates hint" do
		expect(game.update_hint).to eq " _ "*answer.length
	end
end