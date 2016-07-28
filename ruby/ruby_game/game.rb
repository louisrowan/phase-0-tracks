=begin
	
Input: word or phrase to be guessed

Guess method:
-- input is a character to be guessed
-- guess method checks to see if that character is in the word to be guessed

Hint method:
-- input is the last character guessed
-- outputs a hint showing only the previously guessed characters

=end

class Game

	def setup(answer)
		@answer = answer
		@guesses_left = answer.length
		@hint = answer.split('')
		@already_guessed = []
	end

	def guess(guess)
		@guess = guess
		return @guess
	end

end

x = Game.new
word = "bananas"
x.setup(word)